<template>
  <div class='senators-container'>
    <h2>US Senators</h2>
    <div class='senator-legend'>
      <div class='republican-color legend-item'></div>
      <div class='legend-item'>Republican</div>
      <div class='democrat-color legend-item'></div>
      <div class='legend-item'>Democrat</div>
      <div class='independent-color legend-item'></div>
      <div class='legend-item'>Independent</div>
    </div>
    <input v-model='name' class='u-full-width' type='text' placeholder='Search...'>
    <div v-for='senator in filteredSenators' v-bind:key='senator.id'>
      <div v-if='senator.in_office'>
        <div class='senator-card party' v-bind:class='senator.party'>
          <div class='senator-summary'>
            <div class='senator-column'>
              <div class='senator-name'>
                <h4>
                  <router-link :to="{ name: 'Senator', params: { id: senator.id }}">
                    {{ senator.first_name }} {{ senator.last_name }}
                  </router-link>
                </h4>
              </div>
              <div class='senator-state'>
                <strong>State: </strong>{{ senator.state }}
              </div>
              <div>
                <strong>Title: </strong>{{ senator.title }}
              </div>
              <div>
                <strong>Phone: </strong>{{ senator.phone }}
              </div>
            </div>
            <div class='senator-column'>
              <img :src='getImage(senator.last_name)'>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import _ from 'lodash';

export default {
  name: 'Senators',
  data() {
    return {
      senators: '',
      name: '',
    };
  },
  methods: {
    getImage(name) {
      return `static/${name.replace(' ', '')}.jpg`;
    },
  },
  computed: {
    filteredSenators() {
      if (_.trim(this.name).length === 0) {
        return this.senators;
      }

      return this.senators.filter((member) => {
        const name = _.toLower(`${member.first_name} ${member.last_name}`);
        return name.includes(_.toLower(this.name));
      });
    },
  },
  created() {
    this.$http.get('senators').then((response) => {
      this.senators = response.body;
    });
  },
};
</script>

<style scoped>
.senators-container {
  display: flex;
  flex-direction: column;
  width: 90%;
  margin: 0 auto;
}

.senator-summary {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: stretch;
}

.senator-card {
  padding-top: .5em;
  padding-bottom: .5em;
  padding-left: 1em;
  padding-right: 1em;
  border: solid 1px #ccc;
  margin-bottom: 20px;
}

.party.republican {
  border-left: solid 5px #fb9090;
}

.party.democrat {
  border-left: solid 5px #a3a3e4;
}

.party.independent {
  border-left: solid 5px #a576a5;
}

.senator-column img {
  height:100%;
  max-width: 100px;
  min-width: 100px;
}

.senator-name a {
  text-decoration: none;
}

.republican-color {
  background: #fb9090;
  height: 20px;
  width: 20px;
}

.democrat-color {
  background: #a3a3e4;
  height: 20px;
  width: 20px;
}

.senator-legend {
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  margin-bottom: 1em;
}

.legend-item {
  margin-right: 1em;
}

.independent-color {
  background: #a576a5;
  height: 20px;
  width: 20px;
}
</style>

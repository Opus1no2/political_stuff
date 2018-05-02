<template>
  <div class='senator-container'>
    <div class='senator-box'>
      <div class='senator-column'>
        <h4>{{ senator.first_name }} {{ senator.last_name }}</h4>
        <div><strong>State: </strong>{{ senator.state }}</div>
        <div><strong>Party: </strong>{{ senator.party }}</div>
        <div><strong>Title: </strong>{{ senator.title }}</div>
        <div><strong>Date of birth: </strong>{{ senator.date_of_birth }}</div>
        <div><strong>Gender: </strong>{{ senator.gender }}</div>
        <div><strong>Office: </strong>{{ senator.office }}</div>
        <div><strong>Phone: </strong>{{ senator.phone }}</div>
        <div><strong>Fax: </strong>{{ senator.fax }}</div>
      </div>
      <div class='senator-column'>
        <img :src='getImage(senator.last_name)'>
      </div>
    </div>
    <div class='senator-box'>
      <div class='senator-column'>
        <h4>Voting Record</h4>
        <div><strong>Total: </strong>{{senator.total_votes}}</div>
        <div><strong>Missed: </strong>{{senator.missed_votes}}</div>
        <div><strong>Percentage missed: </strong>{{senator.missed_votes_pct}}%</div>
        <div>
          <strong>Percentage of votes along party lines: </strong>
          {{senator.votes_with_party_pct}}%
        </div>
      </div>
    </div>
    <div class='senator-box'>
      <div class='senator-column'>
        <h4>Social Media</h4>
        <div><strong>Twitter: </strong>{{ senator.twitter_account }}</div>
        <div><strong>Facebook: </strong>{{ senator.facebook_account }}</div>
        <div><strong>Youtube: </strong>{{ senator.youtube_account }}</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      senator: '',
    };
  },
  methods: {
    getImage(name) {
      if (name) {
        return `static/${name.replace(' ', '')}.jpg`;
      }
      return '';
    },
  },
  created() {
    const id = this.$route.params.id;

    this.$http.get(`senators/${id}`).then((response) => {
      this.senator = response.body;
    });
  },
};
</script>

<style scoped>
.senator-container {
  width: 90%;
  margin: 0 auto;
}

.senator-box {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding: 1em;
  border: solid 1px #ccc;
  margin-bottom: 2em;
}
</style>

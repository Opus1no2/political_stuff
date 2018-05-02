<template>
  <div class='site-header'>
    <div class='site-header-container'>
      <div class='site-header-logo'>
        <img class='site-header-flag' src='static/flag.svg'>
        <h2><router-link to='/'>Political Stuff</router-link></h2>
      </div>
      <div class='site-header-about'>
        <h6><router-link to='/about' class='site-header-about'>About</router-link></h6>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Header',
};
</script>

<style scoped>
.site-header {
  margin-bottom: 20px;
  color: white;
  background: #292b46;
  min-height: 5em;
}

.site-header-logo {
  display: flex;
  flex-direction: row;
}

.site-header-flag {
  max-width: 100px;
  max-height: 75px;
  padding-right: 1em;
}

.site-header-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 90%;
  margin: 0 auto;
}

.site-header h1 {
  margin: 0;
}

.site-header h2 {
  align-self: center;
  margin-bottom: 0;
}

.site-header-about h6 {
  margin: 0;
}

.site-header a {
  color: white;
  text-decoration: none;
}
</style>

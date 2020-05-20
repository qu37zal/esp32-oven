<template>
  <footer class="footer">
    <div class="container-fluid d-flex flex-wrap justify-content-between">
      <nav>
        <ul>
          <li>
            <router-link :to="{path:'/admin'}">Admin</router-link>
          </li>
        </ul>
      </nav>
      <div class="copyright d-flex flex-wrap">
        &copy; Designed by <a href="https://github.com/qu37zal" target="_blank">&nbsp; Jeremy Rodgers</a>, May 2020, All Rights Reserved.
      </div>
    </div>
  </footer>
</template>
<script>
export default {};
</script>
<style>
</style>

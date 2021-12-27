Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C9E29CA
	for <llvm@lists.linux.dev>; Mon, 27 Dec 2021 15:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640617349; x=1672153349;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ExGnx3cTts4RNRzfnKap0KwrCWphkTYL2gRaYVY1wxQ=;
  b=S4Y8iggOrnipTfbKf/L9JwBcPupScEKiNIw1i5Fgzmywgpgx8xfBksNS
   Ait0Vp8NsLy+YDjvE6xdcqyR78jquhrUXa5Q4T0ijCvOxzEOpavYQs48o
   NMIhLl8Wpf2A3thDp/13KOHOMGC4MOpQjJJd1OgGUAFlV1KOTjCNLkBWG
   tA5HUGIHbr+KamkWEf/VaD5l4vbVZFHNBCzCeg1pAtdYVqZ+LFHTklpNr
   0FwfJP1rkDH42U6EQMGxhtynwmvGfjpq9/J4la8xjVYzGR00sX5xTTclz
   ZRZiqmeuIlRK25KUM1VsMyUiV77fZAD0r4G1mpOBaMqGS8EYq/As8kq4w
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="221220829"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="221220829"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2021 07:02:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
   d="scan'208";a="588782651"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Dec 2021 07:02:26 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1rW5-0006Ro-QU; Mon, 27 Dec 2021 15:02:25 +0000
Date: Mon, 27 Dec 2021 23:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 25/34] brcmfmac: cfg80211: Add support for PMKID_V3
 operations
Message-ID: <202112272226.cnd1yX00-lkp@intel.com>
References: <20211226153624.162281-26-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211226153624.162281-26-marcan@marcan.st>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Hector,

I love your patch! Perhaps something to improve:

[auto build test WARNING on kvalo-wireless-drivers-next/master]
[also build test WARNING on kvalo-wireless-drivers/master rafael-pm/linux-next net-next/master net/master robh/for-next linus/master v5.16-rc7 next-20211224]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Hector-Martin/brcmfmac-Support-Apple-T2-and-M1-platforms/20211226-234246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next.git master
config: arm-randconfig-r023-20211227 (https://download.01.org/0day-ci/archive/20211227/202112272226.cnd1yX00-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 511726c64d3b6cca66f7c54d457d586aa3129f67)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/4077393e01c6f0a14a1ba9afa8d2c56dabd4f1fc
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Hector-Martin/brcmfmac-Support-Apple-T2-and-M1-platforms/20211226-234246
        git checkout 4077393e01c6f0a14a1ba9afa8d2c56dabd4f1fc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/broadcom/brcm80211/brcmfmac/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4195:1: warning: stack frame size (1824) exceeds limit (1024) in 'brcmf_cfg80211_flush_pmksa' [-Wframe-larger-than]
   brcmf_cfg80211_flush_pmksa(struct wiphy *wiphy, struct net_device *ndev)
   ^
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c:4054:1: warning: stack frame size (1832) exceeds limit (1024) in 'brcmf_pmksa_v3_op' [-Wframe-larger-than]
   brcmf_pmksa_v3_op(struct brcmf_if *ifp, struct cfg80211_pmksa *pmksa,
   ^
   2 warnings generated.


vim +/brcmf_cfg80211_flush_pmksa +4195 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

48ed16e86b2823 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-02  4052  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4053  static s32
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27 @4054  brcmf_pmksa_v3_op(struct brcmf_if *ifp, struct cfg80211_pmksa *pmksa,
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4055  		  bool alive)
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4056  {
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4057  	struct brcmf_pmk_op_v3_le pmk_op;
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4058  	int length = offsetof(struct brcmf_pmk_op_v3_le, pmk);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4059  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4060  	memset(&pmk_op, 0, sizeof(pmk_op));
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4061  	pmk_op.version = cpu_to_le16(BRCMF_PMKSA_VER_3);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4062  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4063  	if (!pmksa) {
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4064  		/* Flush operation, operate on entire list */
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4065  		pmk_op.count = cpu_to_le16(0);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4066  	} else {
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4067  		/* Single PMK operation */
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4068  		pmk_op.count = cpu_to_le16(1);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4069  		length += sizeof(struct brcmf_pmksa_v3);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4070  		memcpy(pmk_op.pmk[0].bssid, pmksa->bssid, ETH_ALEN);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4071  		memcpy(pmk_op.pmk[0].pmkid, pmksa->pmkid, WLAN_PMKID_LEN);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4072  		pmk_op.pmk[0].pmkid_len = WLAN_PMKID_LEN;
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4073  		pmk_op.pmk[0].time_left = alive ? BRCMF_PMKSA_NO_EXPIRY : 0;
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4074  	}
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4075  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4076  	pmk_op.length = cpu_to_le16(length);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4077  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4078  	return brcmf_fil_iovar_data_set(ifp, "pmkid_info", &pmk_op, sizeof(pmk_op));
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4079  }
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4080  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4081  static __used s32
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4082  brcmf_update_pmklist(struct brcmf_cfg80211_info *cfg, struct brcmf_if *ifp)
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4083  {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4084  	struct brcmf_pmk_list_le *pmk_list;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4085  	int i;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4086  	u32 npmk;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4087  	s32 err;
48ed16e86b2823 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-02  4088  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4089  	pmk_list = &cfg->pmk_list;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4090  	npmk = le32_to_cpu(pmk_list->npmk);
48ed16e86b2823 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-02  4091  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4092  	brcmf_dbg(CONN, "No of elements %d\n", npmk);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4093  	for (i = 0; i < npmk; i++)
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4094  		brcmf_dbg(CONN, "PMK[%d]: %pM\n", i, &pmk_list->pmk[i].bssid);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4095  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4096  	err = brcmf_fil_iovar_data_set(ifp, "pmkid_info", pmk_list,
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4097  				       sizeof(*pmk_list));
48ed16e86b2823 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-02  4098  
48ed16e86b2823 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-02  4099  	return err;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4100  }
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4101  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4102  static s32
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4103  brcmf_cfg80211_set_pmksa(struct wiphy *wiphy, struct net_device *ndev,
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4104  			 struct cfg80211_pmksa *pmksa)
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4105  {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4106  	struct brcmf_cfg80211_info *cfg = wiphy_to_cfg(wiphy);
c1179033228504 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-10-22  4107  	struct brcmf_if *ifp = netdev_priv(ndev);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4108  	struct brcmf_pmksa *pmk = &cfg->pmk_list.pmk[0];
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki    2019-02-15  4109  	struct brcmf_pub *drvr = cfg->pub;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4110  	s32 err;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4111  	u32 npmk, i;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4112  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4113  	brcmf_dbg(TRACE, "Enter\n");
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4114  	if (!check_vif_up(ifp->vif))
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4115  		return -EIO;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4116  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4117  	brcmf_dbg(CONN, "set_pmksa - PMK bssid: %pM =\n", pmksa->bssid);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4118  	brcmf_dbg(CONN, "%*ph\n", WLAN_PMKID_LEN, pmksa->pmkid);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4119  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4120  	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4121  		return brcmf_pmksa_v3_op(ifp, pmksa, true);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4122  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4123  	/* TODO: implement PMKID_V2 */
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4124  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4125  	npmk = le32_to_cpu(cfg->pmk_list.npmk);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4126  	for (i = 0; i < npmk; i++)
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4127  		if (!memcmp(pmksa->bssid, pmk[i].bssid, ETH_ALEN))
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4128  			break;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4129  	if (i < BRCMF_MAXPMKID) {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4130  		memcpy(pmk[i].bssid, pmksa->bssid, ETH_ALEN);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4131  		memcpy(pmk[i].pmkid, pmksa->pmkid, WLAN_PMKID_LEN);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4132  		if (i == npmk) {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4133  			npmk++;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4134  			cfg->pmk_list.npmk = cpu_to_le32(npmk);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4135  		}
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4136  	} else {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki    2019-02-15  4137  		bphy_err(drvr, "Too many PMKSA entries cached %d\n", npmk);
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4138  		return -EINVAL;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4139  	}
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4140  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4141  	err = brcmf_update_pmklist(cfg, ifp);
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4142  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4143  	brcmf_dbg(TRACE, "Exit\n");
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4144  	return err;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4145  }
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4146  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4147  static s32
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4148  brcmf_cfg80211_del_pmksa(struct wiphy *wiphy, struct net_device *ndev,
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4149  			 struct cfg80211_pmksa *pmksa)
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4150  {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4151  	struct brcmf_cfg80211_info *cfg = wiphy_to_cfg(wiphy);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4152  	struct brcmf_if *ifp = netdev_priv(ndev);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4153  	struct brcmf_pmksa *pmk = &cfg->pmk_list.pmk[0];
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki    2019-02-15  4154  	struct brcmf_pub *drvr = cfg->pub;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4155  	s32 err;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4156  	u32 npmk, i;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4157  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4158  	brcmf_dbg(TRACE, "Enter\n");
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4159  	if (!check_vif_up(ifp->vif))
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4160  		return -EIO;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4161  
7703773ef1d85b drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Nicolas Iooss    2016-08-23  4162  	brcmf_dbg(CONN, "del_pmksa - PMK bssid = %pM\n", pmksa->bssid);
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4163  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4164  	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4165  		return brcmf_pmksa_v3_op(ifp, pmksa, false);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4166  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4167  	/* TODO: implement PMKID_V2 */
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4168  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4169  	npmk = le32_to_cpu(cfg->pmk_list.npmk);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4170  	for (i = 0; i < npmk; i++)
7703773ef1d85b drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Nicolas Iooss    2016-08-23  4171  		if (!memcmp(pmksa->bssid, pmk[i].bssid, ETH_ALEN))
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4172  			break;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4173  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4174  	if ((npmk > 0) && (i < npmk)) {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4175  		for (; i < (npmk - 1); i++) {
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4176  			memcpy(&pmk[i].bssid, &pmk[i + 1].bssid, ETH_ALEN);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4177  			memcpy(&pmk[i].pmkid, &pmk[i + 1].pmkid,
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4178  			       WLAN_PMKID_LEN);
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4179  		}
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4180  		memset(&pmk[i], 0, sizeof(*pmk));
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4181  		cfg->pmk_list.npmk = cpu_to_le32(npmk - 1);
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4182  	} else {
16e64676839633 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Rafał Miłecki    2019-02-15  4183  		bphy_err(drvr, "Cache entry not found\n");
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4184  		return -EINVAL;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4185  	}
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4186  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4187  	err = brcmf_update_pmklist(cfg, ifp);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4188  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4189  	brcmf_dbg(TRACE, "Exit\n");
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4190  	return err;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4191  
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4192  }
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4193  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4194  static s32
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05 @4195  brcmf_cfg80211_flush_pmksa(struct wiphy *wiphy, struct net_device *ndev)
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4196  {
27a68fe391231b drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-27  4197  	struct brcmf_cfg80211_info *cfg = wiphy_to_cfg(wiphy);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4198  	struct brcmf_if *ifp = netdev_priv(ndev);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4199  	s32 err;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4200  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4201  	brcmf_dbg(TRACE, "Enter\n");
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4202  	if (!check_vif_up(ifp->vif))
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4203  		return -EIO;
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4204  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4205  	if (brcmf_feat_is_enabled(ifp, BRCMF_FEAT_PMKID_V3))
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4206  		return brcmf_pmksa_v3_op(ifp, NULL, false);
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4207  
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4208  	/* TODO: implement PMKID_V2 */
4077393e01c6f0 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hector Martin    2021-12-27  4209  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4210  	memset(&cfg->pmk_list, 0, sizeof(cfg->pmk_list));
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4211  	err = brcmf_update_pmklist(cfg, ifp);
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4212  
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4213  	brcmf_dbg(TRACE, "Exit\n");
5419f7f17d5b70 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c Hante Meuleman   2016-01-05  4214  	return err;
e58060723c91a2 drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c       Arend van Spriel 2012-09-19  4215  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

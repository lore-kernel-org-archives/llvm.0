Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836E264D
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 02:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645584975; x=1677120975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d1c8QT29N7ks+2/EYCEs/x9GaXS2sb8QK/ApyPchNZE=;
  b=UEhE8kBAbkSXxp9W8p0bMSXoY+SIYwuwzdCN6a4Eq7ec1dp+iIF9ziMZ
   bARlHcHJ11ReFtuheV7guwCs5tRPiAjapkGK+7He/KvkA7CujhdA5U9X4
   qLRC2DG9QKuf9sHWElj6ryr89IO2snXozvA7z+NsLiwjBGTiwbdKlaCkt
   X+dtJgWVJcBOmTIXG6TuyQ0PUj7yAPH5oJC/xWOSEg3NyQaL+twU9X5Qx
   EmcO6a0cSLYs9hIPBBVSGDjdqbUwSJ9rKQx6+UW6JobZSSz1X43wH0sIA
   BaRxfSX6rw4N8ooL36aQ/rYAiZPegF3hBuiJIENk8gZeUPwGSSg0mYXnq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315099111"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="315099111"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 18:56:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600"; 
   d="scan'208";a="627924828"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Feb 2022 18:56:13 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMhp6-0000uZ-Rc; Wed, 23 Feb 2022 02:56:12 +0000
Date: Wed, 23 Feb 2022 10:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC] Bluetooth: SCO: Fix codec when using
 HCI_Enhanced_Setup_Synchronous_Connection
Message-ID: <202202231010.N2dnVcSC-lkp@intel.com>
References: <20220222212227.24515-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220222212227.24515-1-luiz.dentz@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Luiz,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on linus/master v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-SCO-Fix-codec-when-using-HCI_Enhanced_Setup_Synchronous_Connection/20220223-052337
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
config: x86_64-randconfig-a011-20220221 (https://download.01.org/0day-ci/archive/20220223/202202231010.N2dnVcSC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/04f5ce131261635df1672e71bb21ddd6ed96cbde
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Luiz-Augusto-von-Dentz/Bluetooth-SCO-Fix-codec-when-using-HCI_Enhanced_Setup_Synchronous_Connection/20220223-052337
        git checkout 04f5ce131261635df1672e71bb21ddd6ed96cbde
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/bluetooth/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/bluetooth/sco.c:885:15: warning: variable 'hdev' is uninitialized when used here [-Wuninitialized]
                   hci_dev_put(hdev);
                               ^~~~
   net/bluetooth/sco.c:833:22: note: initialize the variable 'hdev' to silence this warning
           struct hci_dev *hdev;
                               ^
                                = NULL
   1 warning generated.


vim +/hdev +885 net/bluetooth/sco.c

20714bfef84d3e Frédéric Dalleau       2012-11-21  824  
c4297e8f7f453c Marcel Holtmann        2015-10-26  825  static int sco_sock_setsockopt(struct socket *sock, int level, int optname,
a7b75c5a8c4144 Christoph Hellwig      2020-07-23  826  			       sockptr_t optval, unsigned int optlen)
^1da177e4c3f41 Linus Torvalds         2005-04-16  827  {
^1da177e4c3f41 Linus Torvalds         2005-04-16  828  	struct sock *sk = sock->sk;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  829  	int len, err = 0;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  830  	struct bt_voice voice;
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  831  	u32 opt;
f6873401a60865 Kiran K                2021-09-07  832  	struct bt_codecs *codecs;
f6873401a60865 Kiran K                2021-09-07  833  	struct hci_dev *hdev;
f6873401a60865 Kiran K                2021-09-07  834  	__u8 buffer[255];
^1da177e4c3f41 Linus Torvalds         2005-04-16  835  
^1da177e4c3f41 Linus Torvalds         2005-04-16  836  	BT_DBG("sk %p", sk);
^1da177e4c3f41 Linus Torvalds         2005-04-16  837  
^1da177e4c3f41 Linus Torvalds         2005-04-16  838  	lock_sock(sk);
^1da177e4c3f41 Linus Torvalds         2005-04-16  839  
^1da177e4c3f41 Linus Torvalds         2005-04-16  840  	switch (optname) {
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  841  
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  842  	case BT_DEFER_SETUP:
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  843  		if (sk->sk_state != BT_BOUND && sk->sk_state != BT_LISTEN) {
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  844  			err = -EINVAL;
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  845  			break;
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  846  		}
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  847  
a7b75c5a8c4144 Christoph Hellwig      2020-07-23  848  		if (copy_from_sockptr(&opt, optval, sizeof(u32))) {
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  849  			err = -EFAULT;
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  850  			break;
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  851  		}
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  852  
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  853  		if (opt)
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  854  			set_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  855  		else
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  856  			clear_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags);
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  857  		break;
b96e9c671b05f9 Frédéric Dalleau       2012-11-21  858  
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  859  	case BT_VOICE:
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  860  		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  861  		    sk->sk_state != BT_CONNECT2) {
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  862  			err = -EINVAL;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  863  			break;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  864  		}
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  865  
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  866  		voice.setting = sco_pi(sk)->setting;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  867  
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  868  		len = min_t(unsigned int, sizeof(voice), optlen);
a7b75c5a8c4144 Christoph Hellwig      2020-07-23  869  		if (copy_from_sockptr(&voice, optval, len)) {
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  870  			err = -EFAULT;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  871  			break;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  872  		}
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  873  
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  874  		/* Explicitly check for these values */
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  875  		if (voice.setting != BT_VOICE_TRANSPARENT &&
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  876  		    voice.setting != BT_VOICE_CVSD_16BIT) {
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  877  			err = -EINVAL;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  878  			break;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  879  		}
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  880  
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  881  		sco_pi(sk)->setting = voice.setting;
04f5ce13126163 Luiz Augusto von Dentz 2022-02-22  882  		if (voice.setting == BT_VOICE_TRANSPARENT)
04f5ce13126163 Luiz Augusto von Dentz 2022-02-22  883  			sco_pi(sk)->codec.id = BT_CODEC_MSBC;
04f5ce13126163 Luiz Augusto von Dentz 2022-02-22  884  
b2af264ad3af43 Kiran K                2021-09-07 @885  		hci_dev_put(hdev);
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  886  		break;
ad10b1a48754b1 Frédéric Dalleau       2013-08-19  887  
00398e1d518309 Alain Michaud          2020-06-11  888  	case BT_PKT_STATUS:
83a33b248763f0 David S. Miller        2020-07-31  889  		if (copy_from_sockptr(&opt, optval, sizeof(u32))) {
00398e1d518309 Alain Michaud          2020-06-11  890  			err = -EFAULT;
00398e1d518309 Alain Michaud          2020-06-11  891  			break;
00398e1d518309 Alain Michaud          2020-06-11  892  		}
00398e1d518309 Alain Michaud          2020-06-11  893  
00398e1d518309 Alain Michaud          2020-06-11  894  		if (opt)
00398e1d518309 Alain Michaud          2020-06-11  895  			sco_pi(sk)->cmsg_mask |= SCO_CMSG_PKT_STATUS;
00398e1d518309 Alain Michaud          2020-06-11  896  		else
00398e1d518309 Alain Michaud          2020-06-11  897  			sco_pi(sk)->cmsg_mask &= SCO_CMSG_PKT_STATUS;
00398e1d518309 Alain Michaud          2020-06-11  898  		break;
00398e1d518309 Alain Michaud          2020-06-11  899  
f6873401a60865 Kiran K                2021-09-07  900  	case BT_CODEC:
f6873401a60865 Kiran K                2021-09-07  901  		if (sk->sk_state != BT_OPEN && sk->sk_state != BT_BOUND &&
f6873401a60865 Kiran K                2021-09-07  902  		    sk->sk_state != BT_CONNECT2) {
f6873401a60865 Kiran K                2021-09-07  903  			err = -EINVAL;
f6873401a60865 Kiran K                2021-09-07  904  			break;
f6873401a60865 Kiran K                2021-09-07  905  		}
f6873401a60865 Kiran K                2021-09-07  906  
f6873401a60865 Kiran K                2021-09-07  907  		hdev = hci_get_route(&sco_pi(sk)->dst, &sco_pi(sk)->src,
f6873401a60865 Kiran K                2021-09-07  908  				     BDADDR_BREDR);
f6873401a60865 Kiran K                2021-09-07  909  		if (!hdev) {
f6873401a60865 Kiran K                2021-09-07  910  			err = -EBADFD;
f6873401a60865 Kiran K                2021-09-07  911  			break;
f6873401a60865 Kiran K                2021-09-07  912  		}
f6873401a60865 Kiran K                2021-09-07  913  
f6873401a60865 Kiran K                2021-09-07  914  		if (!hci_dev_test_flag(hdev, HCI_OFFLOAD_CODECS_ENABLED)) {
f6873401a60865 Kiran K                2021-09-07  915  			hci_dev_put(hdev);
f6873401a60865 Kiran K                2021-09-07  916  			err = -EOPNOTSUPP;
f6873401a60865 Kiran K                2021-09-07  917  			break;
f6873401a60865 Kiran K                2021-09-07  918  		}
f6873401a60865 Kiran K                2021-09-07  919  
f6873401a60865 Kiran K                2021-09-07  920  		if (!hdev->get_data_path_id) {
f6873401a60865 Kiran K                2021-09-07  921  			hci_dev_put(hdev);
f6873401a60865 Kiran K                2021-09-07  922  			err = -EOPNOTSUPP;
f6873401a60865 Kiran K                2021-09-07  923  			break;
f6873401a60865 Kiran K                2021-09-07  924  		}
f6873401a60865 Kiran K                2021-09-07  925  
f6873401a60865 Kiran K                2021-09-07  926  		if (optlen < sizeof(struct bt_codecs) ||
f6873401a60865 Kiran K                2021-09-07  927  		    optlen > sizeof(buffer)) {
f6873401a60865 Kiran K                2021-09-07  928  			hci_dev_put(hdev);
f6873401a60865 Kiran K                2021-09-07  929  			err = -EINVAL;
f6873401a60865 Kiran K                2021-09-07  930  			break;
f6873401a60865 Kiran K                2021-09-07  931  		}
f6873401a60865 Kiran K                2021-09-07  932  
f6873401a60865 Kiran K                2021-09-07  933  		if (copy_from_sockptr(buffer, optval, optlen)) {
f6873401a60865 Kiran K                2021-09-07  934  			hci_dev_put(hdev);
f6873401a60865 Kiran K                2021-09-07  935  			err = -EFAULT;
f6873401a60865 Kiran K                2021-09-07  936  			break;
f6873401a60865 Kiran K                2021-09-07  937  		}
f6873401a60865 Kiran K                2021-09-07  938  
f6873401a60865 Kiran K                2021-09-07  939  		codecs = (void *)buffer;
f6873401a60865 Kiran K                2021-09-07  940  
f6873401a60865 Kiran K                2021-09-07  941  		if (codecs->num_codecs > 1) {
f6873401a60865 Kiran K                2021-09-07  942  			hci_dev_put(hdev);
f6873401a60865 Kiran K                2021-09-07  943  			err = -EINVAL;
f6873401a60865 Kiran K                2021-09-07  944  			break;
f6873401a60865 Kiran K                2021-09-07  945  		}
f6873401a60865 Kiran K                2021-09-07  946  
f6873401a60865 Kiran K                2021-09-07  947  		sco_pi(sk)->codec = codecs->codecs[0];
f6873401a60865 Kiran K                2021-09-07  948  		hci_dev_put(hdev);
f6873401a60865 Kiran K                2021-09-07  949  		break;
f6873401a60865 Kiran K                2021-09-07  950  
^1da177e4c3f41 Linus Torvalds         2005-04-16  951  	default:
^1da177e4c3f41 Linus Torvalds         2005-04-16  952  		err = -ENOPROTOOPT;
^1da177e4c3f41 Linus Torvalds         2005-04-16  953  		break;
^1da177e4c3f41 Linus Torvalds         2005-04-16  954  	}
^1da177e4c3f41 Linus Torvalds         2005-04-16  955  
^1da177e4c3f41 Linus Torvalds         2005-04-16  956  	release_sock(sk);
^1da177e4c3f41 Linus Torvalds         2005-04-16  957  	return err;
^1da177e4c3f41 Linus Torvalds         2005-04-16  958  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  959  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

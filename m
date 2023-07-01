Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B915A5;
	Sat,  1 Jul 2023 16:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688229980; x=1719765980;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpBLTiZAkgLYAgc/awZjO9wpQmFf3GibSXy+NagE4q4=;
  b=Lg8ffS9vPYknV0FJTkepa7NEpZOrwF5THnv7+sgruvP5pAiOPYMgYEs3
   c7Duf2tVd9cgM9x0Eh1Rmh/jVGniHJhTESRy1HHfwCS0O0stRrext4HCG
   kkHYG3skw/wWrvQuShogrKxnITLeBVWZJh6XUYSigiYwWjMnp1pnPEVPG
   bLc0xkZuMIVexwJuqI88nYFwVKAQEx1QokMVPtCnpR1DJgm+P/OnqPSWq
   FgyIZtvY31TB+kVfxPLoAr55VE+zCIzxSgnSqRO2JDtWK/6dxsNSkCWWL
   gm0vqtVEdeTs5//DKZJa6mtPNfLArIINwoVCIZ1lmUFv3kvg9LWBXNwwz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="393342615"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="393342615"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2023 09:46:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10758"; a="668316570"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="668316570"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Jul 2023 09:46:16 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFdjj-000G8v-2h;
	Sat, 01 Jul 2023 16:46:15 +0000
Date: Sun, 2 Jul 2023 00:45:27 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Shurong <zhang_shurong@foxmail.com>, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	u.kleine-koenig@pengutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: Re: [PATCH] usb: r8a66597-hcd: host: fix port index underflow and
 UBSAN complains
Message-ID: <202307020021.86RVwiyt-lkp@intel.com>
References: <tencent_71A3B792C0AA3D9E148E517B24BC6E006A09@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_71A3B792C0AA3D9E148E517B24BC6E006A09@qq.com>

Hi Zhang,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus westeri-thunderbolt/next linus/master v6.4 next-20230630]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Shurong/usb-r8a66597-hcd-host-fix-port-index-underflow-and-UBSAN-complains/20230701-223726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/tencent_71A3B792C0AA3D9E148E517B24BC6E006A09%40qq.com
patch subject: [PATCH] usb: r8a66597-hcd: host: fix port index underflow and UBSAN complains
config: mips-randconfig-r003-20230701 (https://download.01.org/0day-ci/archive/20230702/202307020021.86RVwiyt-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230702/202307020021.86RVwiyt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307020021.86RVwiyt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/host/r8a66597-hcd.c:2147:11: error: invalid '-=' at end of declaration; did you mean '='?
           int port -= (port_index > 0);
                    ^~
                    =
   1 error generated.


vim +2147 drivers/usb/host/r8a66597-hcd.c

  2138	
  2139	static int r8a66597_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
  2140					u16 wIndex, char *buf, u16 wLength)
  2141	{
  2142		struct r8a66597 *r8a66597 = hcd_to_r8a66597(hcd);
  2143		int ret;
  2144		unsigned long flags;
  2145		u32 port_index = wIndex & 0xFF;
  2146	
> 2147		int port -= (port_index > 0);
  2148		struct r8a66597_root_hub *rh = &r8a66597->root_hub[port];
  2149	
  2150		ret = 0;
  2151	
  2152		spin_lock_irqsave(&r8a66597->lock, flags);
  2153		switch (typeReq) {
  2154		case ClearHubFeature:
  2155		case SetHubFeature:
  2156			switch (wValue) {
  2157			case C_HUB_OVER_CURRENT:
  2158			case C_HUB_LOCAL_POWER:
  2159				break;
  2160			default:
  2161				goto error;
  2162			}
  2163			break;
  2164		case ClearPortFeature:
  2165			if (wIndex > r8a66597->max_root_hub)
  2166				goto error;
  2167			if (wLength != 0)
  2168				goto error;
  2169	
  2170			switch (wValue) {
  2171			case USB_PORT_FEAT_ENABLE:
  2172				rh->port &= ~USB_PORT_STAT_POWER;
  2173				break;
  2174			case USB_PORT_FEAT_SUSPEND:
  2175				break;
  2176			case USB_PORT_FEAT_POWER:
  2177				r8a66597_port_power(r8a66597, port, 0);
  2178				break;
  2179			case USB_PORT_FEAT_C_ENABLE:
  2180			case USB_PORT_FEAT_C_SUSPEND:
  2181			case USB_PORT_FEAT_C_CONNECTION:
  2182			case USB_PORT_FEAT_C_OVER_CURRENT:
  2183			case USB_PORT_FEAT_C_RESET:
  2184				break;
  2185			default:
  2186				goto error;
  2187			}
  2188			rh->port &= ~(1 << wValue);
  2189			break;
  2190		case GetHubDescriptor:
  2191			r8a66597_hub_descriptor(r8a66597,
  2192						(struct usb_hub_descriptor *)buf);
  2193			break;
  2194		case GetHubStatus:
  2195			*buf = 0x00;
  2196			break;
  2197		case GetPortStatus:
  2198			if (wIndex > r8a66597->max_root_hub)
  2199				goto error;
  2200			*(__le32 *)buf = cpu_to_le32(rh->port);
  2201			break;
  2202		case SetPortFeature:
  2203			if (wIndex > r8a66597->max_root_hub)
  2204				goto error;
  2205			if (wLength != 0)
  2206				goto error;
  2207	
  2208			switch (wValue) {
  2209			case USB_PORT_FEAT_SUSPEND:
  2210				break;
  2211			case USB_PORT_FEAT_POWER:
  2212				r8a66597_port_power(r8a66597, port, 1);
  2213				rh->port |= USB_PORT_STAT_POWER;
  2214				break;
  2215			case USB_PORT_FEAT_RESET: {
  2216				struct r8a66597_device *dev = rh->dev;
  2217	
  2218				rh->port |= USB_PORT_STAT_RESET;
  2219	
  2220				disable_r8a66597_pipe_all(r8a66597, dev);
  2221				free_usb_address(r8a66597, dev, 1);
  2222	
  2223				r8a66597_mdfy(r8a66597, USBRST, USBRST | UACT,
  2224					      get_dvstctr_reg(port));
  2225				mod_timer(&r8a66597->rh_timer,
  2226					  jiffies + msecs_to_jiffies(50));
  2227				}
  2228				break;
  2229			default:
  2230				goto error;
  2231			}
  2232			rh->port |= 1 << wValue;
  2233			break;
  2234		default:
  2235	error:
  2236			ret = -EPIPE;
  2237			break;
  2238		}
  2239	
  2240		spin_unlock_irqrestore(&r8a66597->lock, flags);
  2241		return ret;
  2242	}
  2243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

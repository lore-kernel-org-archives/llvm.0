Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455392F56
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 12:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648298239; x=1679834239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2qNhWmWOmaV+zWM8jy09FHg0w+HKEVvZwyYHcKgSC8Q=;
  b=NhsV30LxmDFB3nGJJULUcOU1kFs0Ypo8ig/HZunPJ6LXuBlGwvrfLY7U
   aseGyzOeUKHDOKNMBWYhoZwOUDTAiiXuNeJLB8npiXBYan/bekL68tCsv
   LlLiy2NOfAf7S6EuVRFsOdofjsmTCGUyKZbK6VHnPLDD2Cftyxe+mnBlG
   pRLB0B+n9HCjmZl0jAbuB9MWRRzP1T6WwgcQ1lbB2s506r5YozeIwXY+x
   v+1XrYI7Q5tUqg0ztWCPqF+crZlpFxMc/REb2J9hVhcTeHbG9G0ajGzaK
   UtMcBCfs2N7aJzok8n3pLytjWcfZt2vwMJPn+LyDc5n123f0y1Np2IXR6
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="258968206"
X-IronPort-AV: E=Sophos;i="5.90,213,1643702400"; 
   d="scan'208";a="258968206"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2022 05:37:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,213,1643702400"; 
   d="scan'208";a="520488065"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Mar 2022 05:37:15 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nY5fP-000NMv-5B; Sat, 26 Mar 2022 12:37:15 +0000
Date: Sat, 26 Mar 2022 20:36:25 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Savic <savicaleksa83@gmail.com>, linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (aquacomputer_d5next) Add support for
 Aquacomputer Octo
Message-ID: <202203262032.UaIhk6RY-lkp@intel.com>
References: <20220326101250.8076-1-savicaleksa83@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326101250.8076-1-savicaleksa83@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Aleksa,

I love your patch! Perhaps something to improve:

[auto build test WARNING on groeck-staging/hwmon-next]
[also build test WARNING on next-20220325]
[cannot apply to v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Aleksa-Savic/hwmon-aquacomputer_d5next-Add-support-for-Aquacomputer-Octo/20220326-181328
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220326/202203262032.UaIhk6RY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ffb6d76f23a93a5875a427d03dc6a67538277e19
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Aleksa-Savic/hwmon-aquacomputer_d5next-Add-support-for-Aquacomputer-Octo/20220326-181328
        git checkout ffb6d76f23a93a5875a427d03dc6a67538277e19
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/hwmon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/hwmon/aquacomputer_d5next.c:420:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   default:
                   ^
   drivers/hwmon/aquacomputer_d5next.c:420:3: note: insert 'break;' to avoid fall-through
                   default:
                   ^
                   break; 
   drivers/hwmon/aquacomputer_d5next.c:489:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
                   default:
                   ^
   drivers/hwmon/aquacomputer_d5next.c:489:3: note: insert 'break;' to avoid fall-through
                   default:
                   ^
                   break; 
   drivers/hwmon/aquacomputer_d5next.c:698:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   drivers/hwmon/aquacomputer_d5next.c:698:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   3 warnings generated.


vim +420 drivers/hwmon/aquacomputer_d5next.c

   389	
   390	static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
   391			    int channel, long *val)
   392	{
   393		int ret;
   394		struct aqc_data *priv = dev_get_drvdata(dev);
   395	
   396		if (time_after(jiffies, priv->updated + STATUS_UPDATE_INTERVAL))
   397			return -ENODATA;
   398	
   399		switch (type) {
   400		case hwmon_temp:
   401			if (priv->temp_input[channel] == -ENODATA)
   402				return -ENODATA;
   403	
   404			*val = priv->temp_input[channel];
   405			break;
   406		case hwmon_fan:
   407			*val = priv->speed_input[channel];
   408			break;
   409		case hwmon_power:
   410			*val = priv->power_input[channel];
   411			break;
   412		case hwmon_pwm:
   413			switch (priv->kind) {
   414			case octo:
   415				ret = aqc_get_ctrl_val(priv, octo_ctrl_fan_offsets[channel]);
   416				if (ret < 0)
   417					return ret;
   418	
   419				*val = aqc_percent_to_pwm(ret);
 > 420			default:
   421				break;
   422			}
   423			break;
   424		case hwmon_in:
   425			*val = priv->voltage_input[channel];
   426			break;
   427		case hwmon_curr:
   428			*val = priv->current_input[channel];
   429			break;
   430		default:
   431			return -EOPNOTSUPP;
   432		}
   433	
   434		return 0;
   435	}
   436	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

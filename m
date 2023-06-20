Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C781FA1;
	Tue, 20 Jun 2023 12:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687265897; x=1718801897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rx06My1wOKBznlmcIkXlAcrSPxj2xuDSszYHKnhTV3U=;
  b=CynN59WuwJs2XPnGcrF7rhJB8fc9se8z5H+foxK9DPjwgZRk387WV28s
   gLnKF3dsFmd8h1shqERMrJWZyz11va9BxAr2N4DP1Xvwcugmn8Rai05hy
   xSSjFPuZmr+odWSJmlc4iqvaVtxYa5yNkA8K87XUG+QXbZZi3Xl2y10eh
   QrJgwB5Hn/8OgGEUh0PgKAZuqxl5ODp5Z2VqR9MvuqZSF++kQWgfgaATC
   2bCHMfJ+kKh2wyfkJnY2kUyuWV5mtuyZWlHSBZ0dtfwnRppaxCqwg61qo
   537BpINBmpUikFzDhMl5IjArGcOAYJlu5LP0pN7gWvEszvkAKEpKsJgV+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="363271846"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="363271846"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 05:58:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="784066018"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="784066018"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jun 2023 05:58:12 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBavz-0005tA-3B;
	Tue, 20 Jun 2023 12:58:11 +0000
Date: Tue, 20 Jun 2023 20:57:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/5] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Message-ID: <202306202006.FUjZfd9O-lkp@intel.com>
References: <20230620031111.3776-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620031111.3776-3-yuji2.ishikawa@toshiba.co.jp>

Hi Yuji,

kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linus/master sailus-media-tree/streams v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yuji-Ishikawa/dt-bindings-media-platform-visconti-Add-Toshiba-Visconti-Video-Input-Interface-bindings/20230620-120839
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20230620031111.3776-3-yuji2.ishikawa%40toshiba.co.jp
patch subject: [PATCH v6 2/5] media: platform: visconti: Add Toshiba Visconti Video Input Interface driver
config: x86_64-buildonly-randconfig-r001-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202006.FUjZfd9O-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202006.FUjZfd9O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202006.FUjZfd9O-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/visconti_viif.h:12:
>> usr/include/linux/videodev2.h:2464:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   usr/include/linux/videodev2.h:2464:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

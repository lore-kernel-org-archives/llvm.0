Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFF29CA
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 20:10:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="325093009"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="325093009"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 12:09:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="613961656"
Received: from smile.fi.intel.com ([10.237.72.184])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 12:09:52 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1mwrd0-005lU0-UY;
	Mon, 13 Dec 2021 22:08:54 +0200
Date: Mon, 13 Dec 2021 22:08:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <maz@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
	Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	Colin Foster <colin.foster@in-advantage.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org
Subject: Re: [PATCH v1 2/2] pinctrl: Propagate firmware node from a parent
 device
Message-ID: <YbeoVlka2CHojWgF@smile.fi.intel.com>
References: <20211213163929.7509-2-andriy.shevchenko@linux.intel.com>
 <202112140342.nuGxXwso-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202112140342.nuGxXwso-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Dec 14, 2021 at 03:37:05AM +0800, kernel test robot wrote:
> Hi Andy,
> 
> I love your patch! Yet something to improve:

Yeah, I have got it from the previous mail made by bot, no need to repeat.

-- 
With Best Regards,
Andy Shevchenko



Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061852C85;
	Tue, 16 Nov 2021 12:57:30 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="214408029"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="214408029"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:57:16 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800"; 
   d="scan'208";a="494449208"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2021 04:57:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id D0D5C20287;
	Tue, 16 Nov 2021 14:57:10 +0200 (EET)
Date: Tue, 16 Nov 2021 14:57:10 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH 1/3] media: ipu3: drop an unused variable
Message-ID: <YZOqpvwPq7iz9ryd@paasikivi.fi.intel.com>
References: <cover.1636672052.git.mchehab+huawei@kernel.org>
 <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <990224a5610af19f790d0ec2ebe0610e3b38cf00.1636672052.git.mchehab+huawei@kernel.org>

On Thu, Nov 11, 2021 at 11:08:51PM +0000, Mauro Carvalho Chehab wrote:
> Fix this clang Werror with W=1:
> 
> 	drivers/staging/media/ipu3/ipu3-css-params.c:774:8: error: variable 'pin_scale' set but not used [-Werror,-Wunused-but-set-variable]
> 	                        int pin_scale = 0;
> 	                            ^
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I.e. feel free to merge through your tree, I don't think there's a chance
for conflicts here.

-- 
Sakari Ailus

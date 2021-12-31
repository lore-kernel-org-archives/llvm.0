Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A0A168
	for <llvm@lists.linux.dev>; Fri, 31 Dec 2021 09:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640941846; x=1672477846;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=k6iD2CsmmCXpmRSNBtnKDt7eZEDt3D8xbZ03Fpz/wgI=;
  b=hqns9XvivMBr4J9q7GDWmgAhZ7EhphxF1QKHuZ3DaGtFSRBdSTKk2PPx
   FdUg8k6/BcTjsvz2dVmbohUidILNeyLzDK1WUxuZY1WS2ekB0qba6OhMk
   w3zZDRe8W1mnevOC410uDyHtDwuXoOizP04UoHvxP00u7xB/ebPTQHeO0
   o5TDbDlfYsdwid9exCrblxCRg2QYW9DCpYlMDhJTJty0/Y6kkhlc9MAXh
   z16pxP15+Oc8QLX0LhuOAVT928hrGaShw9yTll2cr9Vp4xxSuJmeML41F
   r9cbh1lBvNC6ZrgfsPpiNlEp5AeKwj0v1oYWS1Y1Z1ObCwLf53XUv+/y8
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="222464022"
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; 
   d="scan'208";a="222464022"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2021 01:10:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,251,1635231600"; 
   d="scan'208";a="687450432"
Received: from arudakov-mobl.ccr.corp.intel.com (HELO localhost) ([10.252.25.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2021 01:10:41 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Claudio Suarez <cssk@net-c.es>, kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: get rid of DRM_DEBUG_* log calls in drm core,
 files drm_{b,c}*.c
In-Reply-To: <Yc4Q7vqVDv/UcaVA@gineta.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <Yc2Pd/DhQ7EpD+hD@gineta.localdomain>
 <202112302236.ikd2ET5w-lkp@intel.com>
 <Yc4Q7vqVDv/UcaVA@gineta.localdomain>
Date: Fri, 31 Dec 2021 11:10:39 +0200
Message-ID: <875yr5jg1c.fsf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 30 Dec 2021, Claudio Suarez <cssk@net-c.es> wrote:
> Please, don't apply this patch. I have to review it,.

Please make sure you build with DRM_LEGACY=y to include drm_bufs.c in
the build.

If you Cc: intel-gfx@lists.freedesktop.org on the patch, you'll get
Intel CI results on the patch too.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

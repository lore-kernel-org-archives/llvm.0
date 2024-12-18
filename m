Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756917DFE3;
	Wed, 18 Dec 2024 09:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734515315; cv=none; b=LSFc9skMOf65PPhUO+4gzaAl16KG0f+FsDVrxVyfEZ1vvzoO1SwCnKy0A2gzSecocJtqXNPuynfOZsmKj9Jpkd/J+auvCcPYTco+v+V+YPUEiP8F0QpS+syFfdVawTY6kCf4A14Qng0itEG+5J9ZFr+3wF8OItTEDAAlG5hGhp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734515315; c=relaxed/simple;
	bh=t3VDoLQH/nwImVNxx8yKcxlYXpnZ/nRYCUG06H65KfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nL6yySAE8MZ8M+7L5ZnfyRynjhpNbcLlFcakku2dmtHyXNrO5JRMq2R8Fk/GLDl/UC2Y/cr0JFnzeCw/XXqH/7UmC+lI3cTqQzQhQucIjbAUeAU113crwpYzOwhDjn/oUTF2oy1l+UxDpnHw7O4ZyDzpga+E+oHYnfYmNKGIM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/DE74tS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/DE74tS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734515313; x=1766051313;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t3VDoLQH/nwImVNxx8yKcxlYXpnZ/nRYCUG06H65KfI=;
  b=K/DE74tS6ebmT/xmOvfVRgAmZWQWnHJv2Hlxki0/7d+N3znUm+8PlnwR
   tGp/I7VdOP4RAkdApXFgMOqYCXwv6tqHjZdDdLX5Q3jTMQlDwpIwAerlf
   /KrxsxpgRKT9ysCfQgGcH0R9k/J1K3V6JlVyzQAL1/1WdFAqSNqeGmRO3
   jdoVKAX4WwE28fxIYOxWSkZ+6BBUClb2Eps5iSFzOzzsEluq262SFrJMa
   rNbeS8Lvzox+KBottWDQKyvn7/1AAtxnmkbiTpiLo598FHg09j+qpWatj
   MJDOEc1l/kjA+gETIrMtVwVQphV6AyFo08T8QgAO2Fbhe/pPkJgdhStfA
   w==;
X-CSE-ConnectionGUID: ZokoNeLhReS5uOJPGcglhg==
X-CSE-MsgGUID: H+ZPi+6rSFiOhgwrin05kA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="46394607"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="46394607"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2024 01:48:32 -0800
X-CSE-ConnectionGUID: PY7e+UdRSBOMlt4wrmcCrg==
X-CSE-MsgGUID: 9PdEsYeDQlqeOM4IX1V0zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="97667605"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa007.fm.intel.com with SMTP; 18 Dec 2024 01:48:27 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 18 Dec 2024 11:48:26 +0200
Date: Wed, 18 Dec 2024 11:48:26 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: tzungbi@kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, akuchynski@google.com,
	sboyd@kernel.org, pmalani@chromium.org, badhri@google.com,
	rdbabiera@google.com, dmitry.baryshkov@linaro.org,
	jthies@google.com, Bill Wendling <morbo@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 4/8] usb: typec: Print err when displayport fails to
 enter
Message-ID: <Z2KaajPTXyndS34i@kuha.fi.intel.com>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213153543.v5.4.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>

On Fri, Dec 13, 2024 at 03:35:45PM -0800, Abhishek Pandit-Subedi wrote:
> Print the error reason for typec_altmode_enter so users can understand
> why displayport failed to enter.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> 
> Changes in v5:
> - Put dev_err on single line.
> - Slip clang-format a washington to look the other way.
> 
>  drivers/usb/typec/altmodes/displayport.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index 3245e03d59e6..ac84a6d64c2f 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -252,7 +252,7 @@ static void dp_altmode_work(struct work_struct *work)
>  	case DP_STATE_ENTER:
>  		ret = typec_altmode_enter(dp->alt, NULL);
>  		if (ret && ret != -EBUSY)
> -			dev_err(&dp->alt->dev, "failed to enter mode\n");
> +			dev_err(&dp->alt->dev, "failed to enter mode: %d\n", ret);
>  		break;
>  	case DP_STATE_ENTER_PRIME:
>  		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
> -- 
> 2.47.1.613.gc27f4b7a9f-goog

-- 
heikki

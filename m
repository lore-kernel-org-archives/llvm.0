Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83737F
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 07:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663227578; x=1694763578;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=qT4pK26WhnKxnisAOU+dg9Nial+Fkme5ipurw767x5k=;
  b=IeXPL+g6LkiE3ky06mbajqHhnyRl+evOsBJwu8Q2cFB5DDLdesShFKsF
   G6SOMMUrwmoNYdTx02L18Vx1QVQdXA/r9ofnxm/VPilluqsP+f/LKSlCx
   8F+BcdkzBHbCnZ2xVzIiVPhEeiRRhuFBt9MFqyG3V1MW0jLJMOzzWKyor
   zWV0MvLcFIdDNjhNXvDXslokqOJBwYlxOQGdNkXMrtgb91zglhblFnT5W
   l6iPNY/LIiAhOFyB+XZhbFRvKmaSyMv3e6KXvy6iUcwwYFU18PX+5BSvl
   Vj+1tb2kvUbVVtFXdbItc0nFby4vPvUEWP50JMe8CJmrOqc8ChemNEoGh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="297367967"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="297367967"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 00:39:38 -0700
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; 
   d="scan'208";a="685618048"
Received: from edgarisx-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.58.204])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 00:39:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Nathan Huckleberry
 <nhuck@google.com>
Cc: Dan Carpenter <error27@gmail.com>, llvm@lists.linux.dev, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Matt Roper
 <matthew.d.roper@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915: Fix return type of mode_valid function hook
In-Reply-To: <YyEP7W/yZAyhNtTX@dev-arch.thelio-3990X>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220913205531.155046-1-nhuck@google.com>
 <YyEP7W/yZAyhNtTX@dev-arch.thelio-3990X>
Date: Thu, 15 Sep 2022 10:39:26 +0300
Message-ID: <87v8pp13yp.fsf@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 13 Sep 2022, Nathan Chancellor <nathan@kernel.org> wrote:
> On Tue, Sep 13, 2022 at 01:55:27PM -0700, Nathan Huckleberry wrote:
>> All of the functions used for intel_dvo_dev_ops.mode_valid have a return
>> type of enum drm_mode_status, but the mode_valid field in the struct
>> definition has a return type of int.
>> 
>> The mismatched return type breaks forward edge kCFI since the underlying
>> function definitions do not match the function hook definition.
>> 
>> The return type of the mode_valid field should be changed from int to
>> enum drm_mode_status.
>> 
>> Reported-by: Dan Carpenter <error27@gmail.com>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1703
>> Cc: llvm@lists.linux.dev
>> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch and reviews, pushed to drm-intel-next.

BR,
Jani.

>
>> ---
>>  drivers/gpu/drm/i915/display/intel_dvo_dev.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_dvo_dev.h b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
>> index d96c3cc46e50..50205f064d93 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dvo_dev.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dvo_dev.h
>> @@ -75,8 +75,8 @@ struct intel_dvo_dev_ops {
>>  	 *
>>  	 * \return MODE_OK if the mode is valid, or another MODE_* otherwise.
>>  	 */
>> -	int (*mode_valid)(struct intel_dvo_device *dvo,
>> -			  struct drm_display_mode *mode);
>> +	enum drm_mode_status (*mode_valid)(struct intel_dvo_device *dvo,
>> +					   struct drm_display_mode *mode);
>>  
>>  	/*
>>  	 * Callback for preparing mode changes on an output
>> -- 
>> 2.37.2.789.g6183377224-goog
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center

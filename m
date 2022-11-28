Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845DA20E2
	for <llvm@lists.linux.dev>; Mon, 28 Nov 2022 07:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3266EC433D6;
	Mon, 28 Nov 2022 07:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669621635;
	bh=+WYQFpWUKXr9b62rzVenfF+a3NLG9DBKuJ3zWIaJbFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=trelwF4unhGqqJGOzUJ2U/lkT86Tjnibc09mApQkJO/TZ2q0Mrmah178G0hbKdiyQ
	 EQnzDwZrv/ScpfLZ1b2cGjnZC/VPkC8RZuGfdaIoWesbK14u3nv17qMoTv+jQrWDlV
	 bCH6iANTSynehLUnJnqJ9iPhELkk3SSyRfaHpLvfnQagMMdYvCs/l5MCHRpmwZJxGZ
	 HAr+LxGZms0NZS/glR1N58y53ypXoE2J7TOHso9rc5OOgM9EfTu487WUM1d181ZDd/
	 v+cSSAscgZr4odczemM+jp7Xe0ZaV3zqT61Yq1WzKSNuHZC3eRLHm2QF8ngrWgP55g
	 dUFTpihSBZcfQ==
Date: Mon, 28 Nov 2022 07:47:06 +0000
From: Lee Jones <lee@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: arnd@arndb.de, nathan@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	daniel@ffwll.ch, ndesaulniers@google.com, trix@redhat.com,
	harry.wentland@amd.com, sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
	christian.koenig@amd.com, Xinhui.Pan@amd.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Fix a bunch of allmodconfig errors
Message-ID: <Y4RnesCbA0yOFI8/@google.com>
References: <20221125120750.3537134-1-lee@kernel.org>
 <20221125161325.bed715211b887d0a298813de@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221125161325.bed715211b887d0a298813de@linux-foundation.org>

On Fri, 25 Nov 2022, Andrew Morton wrote:

> On Fri, 25 Nov 2022 12:07:48 +0000 Lee Jones <lee@kernel.org> wrote:
> 
> > Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST") WERROR 
> > now defaults to COMPILE_TEST meaning that it's enabled for allmodconfig        
> > builds.  This leads to some interesting failures, each resolved in this set.   
> 
> I'm not sure who this patchset is aimed at, so I'll take my usual
> approach of grabbing it and seeing who complains.
> 
> > With this set applied, I am able to obtain a successful allmodconfig Arm build.
> 
> b339ec9c229aa is a year old and I've been doing arm allmodconfig for
> ever.  What am I missing here?
> 
> A broken arm allmodconfig is pretty irritating - I'm thinking that a
> fix should be backported into -stable kernels.  But I'm clearly missing
> something here.

I will be taking these through all applicable Stable kernels.

-- 
Lee Jones [李琼斯]

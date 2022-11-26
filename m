Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0AA184
	for <llvm@lists.linux.dev>; Sat, 26 Nov 2022 00:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C5AC433C1;
	Sat, 26 Nov 2022 00:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669421606;
	bh=F2Iz4FmHG/F1E/NZVczN3uc6knKQCTCJz/o482AKOHI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xc82kQZsd+dQC/numsQShfrRl+O0J8DnCYj1NMIktTDjsGED0IanHoKaOvb7l6l9W
	 oyafUj9mcWJNEimTbhve+jbIwR6TknhuIP/fj2WgmMJHG9oI1T07xeHAmMfC/UNu6A
	 Uq12fxjx9eR+6SxN34H8xSMxLbYx+XtpzKU+ElTI=
Date: Fri, 25 Nov 2022 16:13:25 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Lee Jones <lee@kernel.org>
Cc: arnd@arndb.de, nathan@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, ndesaulniers@google.com, trix@redhat.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Fix a bunch of allmodconfig errors
Message-Id: <20221125161325.bed715211b887d0a298813de@linux-foundation.org>
In-Reply-To: <20221125120750.3537134-1-lee@kernel.org>
References: <20221125120750.3537134-1-lee@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 25 Nov 2022 12:07:48 +0000 Lee Jones <lee@kernel.org> wrote:

> Since b339ec9c229aa ("kbuild: Only default to -Werror if COMPILE_TEST") WERROR 
> now defaults to COMPILE_TEST meaning that it's enabled for allmodconfig        
> builds.  This leads to some interesting failures, each resolved in this set.   

I'm not sure who this patchset is aimed at, so I'll take my usual
approach of grabbing it and seeing who complains.

> With this set applied, I am able to obtain a successful allmodconfig Arm build.

b339ec9c229aa is a year old and I've been doing arm allmodconfig for
ever.  What am I missing here?

A broken arm allmodconfig is pretty irritating - I'm thinking that a
fix should be backported into -stable kernels.  But I'm clearly missing
something here.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DB4184
	for <llvm@lists.linux.dev>; Sat, 26 Nov 2022 00:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381A8C433C1;
	Sat, 26 Nov 2022 00:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1669421878;
	bh=N0BkCIonzZFjorKsjBaLOWHmBGWXxgq4vQOHZYYI+QM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u0dmufMBeU/Hge17mRXBmPGXWvfk84ictiDbNzdkhYWzCJka/K8Y897LxUKz7Vj3z
	 U1yJUtWHtoZFdoY4wBcpYuMB3DmBgMpNNHUtIQgiLA4Nb1IDJvLIqamUoTUitgl9U8
	 USOEXxWnBItN7/5B+3liMkAy2ysF02xGzrkMnRvk=
Date: Fri, 25 Nov 2022 16:17:57 -0800
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
Message-Id: <20221125161757.73f96b3b90f4884509097352@linux-foundation.org>
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

Oh, I get it.  Clang.  I'll tweak the above para to make that clearer.

cc:stable question still applies?  How much trouble will these build
errors be causing people for the next N years?

> With this set applied, I am able to obtain a successful allmodconfig Arm build.

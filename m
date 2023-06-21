Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD94E19BD9
	for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 21:54:19 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1b5422163f4so42225555ad.2
        for <llvm@lists.linux.dev>; Wed, 21 Jun 2023 14:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1687384459; x=1689976459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DBUEVo1q7n30FsHvjVeF7u+PkYrRTPaQ7gRodIMSGHc=;
        b=g0lMw2Rz4vHh0LSVgW2evkSBz+6/980KZyjZCsSI0elex38mMOmUGcG6hJIiOfkjOa
         hh9nR9eDwEO3P9OIJboZkfv2xpsj/GYudHRuxRO2OZ4Gse0PeeiSZgwxjlJpooJyIBmZ
         sdaEEBVfiOw3VSNlfZehux7NzQbiE9ZT91y68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687384459; x=1689976459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBUEVo1q7n30FsHvjVeF7u+PkYrRTPaQ7gRodIMSGHc=;
        b=GeNLawseu3emWB15ibnSTUGcohscd+8OYsJMykHK1CujCZxSMD0ZP1aMp7MJbb1NNg
         ERCNJxNUZ6gm0RJXSw0IPZ+P8skTQDW7AyluJtckvdkXU3KlStXM2SMmHkshHhYl/vJD
         G4OxnHBhKwAB1rjMW0YnLtgxw2qje5TY+OvmnVPlXdZF4wf4lQ1fMEIvlAMasiuEp9/m
         iqPDQr+sqejY/AFkjUC21m9yvq0LCyn1l5OIWnF8/DQ15POuAIyrsBbSZ6ELaADOOnpl
         9ONcDbTmFIl4XXWei/u7GSljz4rA4uxfWn1sph6WF9+sP4zBBAuH+UeLM0c5a9NH27vf
         r+yA==
X-Gm-Message-State: AC+VfDxBI3/d2VpQWiQ75EdPk6Ukoqvauj+PbriVpVgLuvNJlrWpUJB/
	zkh/k/KmFSRDmdaV/r4TGDYeeA==
X-Google-Smtp-Source: ACHHUZ7sSNSEdyXfVFVbwQZyuo/RmgZQEi8YADL8wI+y2YjTTaLRDJ6GJgpQ9q7lMzepkoUPJatsYg==
X-Received: by 2002:a17:902:8c94:b0:1b1:a9e7:5d4b with SMTP id t20-20020a1709028c9400b001b1a9e75d4bmr15712370plo.22.1687384459016;
        Wed, 21 Jun 2023 14:54:19 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b001b6758a2d94sm3903265plr.305.2023.06.21.14.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 14:54:18 -0700 (PDT)
Date: Wed, 21 Jun 2023 14:54:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Dan Li <ashimida.1990@gmail.com>
Cc: Qing Zhao <qing.zhao@oracle.com>, gcc-patches@gcc.gnu.org,
	Richard Sandiford <richard.sandiford@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
	Marco Elver <elver@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Song Liu <song@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uros Bizjak <ubizjak@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>, Borislav Petkov <bp@suse.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Aaron Tomlin <atomlin@redhat.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Changbin Du <changbin.du@intel.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [RFC/RFT,V2 0/3] Add compiler support for Kernel Control Flow
 Integrity
Message-ID: <202306211451.CB0A34563@keescook>
References: <20221219055431.22596-1-ashimida.1990@gmail.com>
 <20230325081117.93245-1-ashimida.1990@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230325081117.93245-1-ashimida.1990@gmail.com>

On Sat, Mar 25, 2023 at 01:11:14AM -0700, Dan Li wrote:
> This series of patches is mainly used to support the control flow
> integrity protection of the linux kernel [1], which is similar to
> -fsanitize=kcfi in clang 16.0 [2,3].
> 
> Any suggestion please let me know :).

Hi Dan,

It's been a couple months, and I didn't see any other feedback on this
proposal. I was curious what the status of this work is. Are you able to
attend GNU Cauldron[1] this year? I'd love to see this get some traction
in GCC.

Thanks!

-Kees

[1] https://gcc.gnu.org/wiki/cauldron2023

-- 
Kees Cook

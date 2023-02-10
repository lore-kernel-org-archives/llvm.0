Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2588433FA
	for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 16:18:39 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id b5so6977696plz.5
        for <llvm@lists.linux.dev>; Fri, 10 Feb 2023 08:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxXdZQxEy9ORSki1sFbClnXS6XD9R5tAV6m7018Aoxg=;
        b=RLLvPVwEe37bC3gIxP2Bv5EbvbxNVa3e9DSJanGQhPNO0KGbiSFyKCQ7dU+E9Ud6dW
         lIs4g+WD8OhzR0WDnPRqrT540emzHx41b2q3WvX/nfsB/EHmW7PhLz4ywQhN4EfAYRuV
         f42OEecWXAMLbOCvgXanc9orcfCRZTm91zG/sGRAIiVbXozInbRILnOr1fnnYLVwW/ES
         rzWtdnF78Chord9FKMSKBmRKsatVzaLls5eh/0nKU1maiIzrpV8MpYD0FD15T5HuReDV
         dGuM3kcGExCcdKn+JWv33YQA+SFbhAioyZUitqsq2h/DiWcj8Y78JDbHXx7Al2bLNfW8
         MpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxXdZQxEy9ORSki1sFbClnXS6XD9R5tAV6m7018Aoxg=;
        b=KZRfPGl/S8JnNsWlH6ALyTUVg6KdDcI5+w+wnZ7rCPJG5RiwrhUBtuOPWlQI790lxU
         ovTCddnwb8B/yKuN5irIt3uYPxFrSbf4oeNHfjHRRcUM2HGOW+A6y7rH9vFfOQntUdqN
         n5xSegYcn7TkwAn3JRzNiOhXlfwWptCOELRLhHC8U3eoE758SAgUmMkDkmPoU1z7rOPV
         I4ED/bPSRHKKmR7qH0CU6LaDmY5TjLCVTliIvi5IKZ9JvWkm8hOnEKRCniP6+FeuZpX1
         AeX8awd+4LqMtyfp9j4ZkZFt7nP40f+fYrzcuGCxoL9KbxYiXJkonK4g8eV03Wsvi8v/
         qEkw==
X-Gm-Message-State: AO0yUKWnWZ8CMaiRs8RCc35W58TdhGIBo9iHgs6MNM6tr55Z3UVUppDR
	E4/NYFM8AwvhMYV4Hq+pz44=
X-Google-Smtp-Source: AK7set8aF8P+ZlNIMzRzl1T1H/DSMSa4lsmTbGM6NWsjEMzuyTqi2Jrn0/eW0THES6OU8oRuG4QGGQ==
X-Received: by 2002:a17:903:2303:b0:195:f06f:84fc with SMTP id d3-20020a170903230300b00195f06f84fcmr17146571plh.40.1676045918601;
        Fri, 10 Feb 2023 08:18:38 -0800 (PST)
Received: from localhost ([124.248.219.206])
        by smtp.gmail.com with ESMTPSA id n3-20020a170902dc8300b00198fe021f93sm2335425pld.77.2023.02.10.08.18.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 08:18:38 -0800 (PST)
Date: Fri, 10 Feb 2023 08:18:27 -0800
From: Dan Li <ashimida.1990@gmail.com>
To: Hongtao Liu <crazylht@gmail.com>
Cc: gcc-patches@gcc.gnu.org, Richard Sandiford <richard.sandiford@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
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
Subject: Re: [RFC/RFT 0/3] Add compiler support for Control Flow Integrity
Message-ID: <20230210161827.ze2dtrfugydlbw2p@ubuntu>
References: <20221219055431.22596-1-ashimida.1990@gmail.com>
 <CAMZc-bzmACcpSePKxuuA=ug2+yik+Zo3-mfqr2OyZ-n_nT=OnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZc-bzmACcpSePKxuuA=ug2+yik+Zo3-mfqr2OyZ-n_nT=OnQ@mail.gmail.com>
User-Agent: NeoMutt/20171215

On 02/09, Hongtao Liu wrote:
> On Mon, Dec 19, 2022 at 3:59 PM Dan Li via Gcc-patches
> <gcc-patches@gcc.gnu.org> wrote:
> >
> > This series of patches is mainly used to support the control flow
> > integrity protection of the linux kernel [1], which is similar to
> > -fsanitize=kcfi in clang 16.0 [2,3].
> >
> > I hope that this feature will also support user-mode CFI in the
> > future (at least for developers who can recompile the runtime),
> > so I use -fsanitize=cfi as a compilation option here.
> >
> > Any suggestion please let me know :).
> Do you have this series as a branch somewhere that we could also try for x86?

Hi Hongtao,

I haven't tried this feature on the x86 platform, if possible, I will try it in
the next version.

Thanks,
Dan.

> --
> BR,
> Hongtao

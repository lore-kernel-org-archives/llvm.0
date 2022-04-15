Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEDA7E
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 13:38:37 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j8so7126961pll.11
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M9rx3SpLFg0yQGkL9rFlw3lXIc0eurp55pdhU3Cwimk=;
        b=RGBADwoDDLTNmBXMbPPibrgnThWpZsdF4Cg8GMAch+oDuOUbSPOHihCnEyOCg+oy/Y
         DkhRQVGkJcFdrCPm09lm8TOAZNvcZGQkPX4n8dBT06wr1vADFyC21HiPtFn2hTL1HnES
         abU1Ko956Xlvvz9jLdsPEtbJ/SU6jX1dh6iKCFyTdrIs3v/HbNKH+cFPIRSf2zZRa24O
         ZEfC4RMNurOZGJb/r/+ef84a2La0Q+s2Np/TlM4/0hlOntv4+bmeRSBOoEM3ETbm2fwW
         mZjkgkhHM2P2XWPVo0pqdgJD5xLGEApWRtVrzKbTNkND31RQKuCO8ulQZxqR698yl0a3
         N29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M9rx3SpLFg0yQGkL9rFlw3lXIc0eurp55pdhU3Cwimk=;
        b=WqdO5VrDT7pFEGf9deCUZUi82jPXuWb+LUcjjpczX0qMqFL3FCLMhXu0gObR9lPfWO
         IF+aoCTR2tVnIN6lhpp0K2JKF2tcmkuuVbIM4lnLRBWJ2n3O9DBFvipyhSqIp0zfUz+z
         k08fBEvmgYtCShr+mlL4azY6ZxHgZtOo0336aDq4HeMcTTF3TBhyO9xuXIUj5R52sTTQ
         uZ1EdqrLk9NHOQmYIdtG+LYHZb3cl812cMCmRqiuzf961N8fjAiDxMRRlLwRvQGv2zbU
         SpMxG3xUt+lk5vu72I200M6kHiC0PRdaWLe8csYdEizn49ZfnqQ3UOiV8ljQQEAllG2M
         KL8g==
X-Gm-Message-State: AOAM533CM6/DXtIS7HMK3tTaiepP+hPWaJzBDmAECTOfS0e9JeTEbneB
	gBZiqVLqrKliBHAHOr1zqcg=
X-Google-Smtp-Source: ABdhPJxC2ecEADuDf7c9/EcF1MlqYrpbH2/Erq7cnCc7MBmBa0VIRIFj/M+p8QKuksJh7sWmOZCQQA==
X-Received: by 2002:a17:902:7298:b0:158:3a08:3163 with SMTP id d24-20020a170902729800b001583a083163mr30186108pll.133.1650029916593;
        Fri, 15 Apr 2022 06:38:36 -0700 (PDT)
Received: from localhost ([112.79.142.104])
        by smtp.gmail.com with ESMTPSA id 35-20020a631763000000b0039d93f8c2f0sm4541611pgx.24.2022.04.15.06.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 06:38:36 -0700 (PDT)
Date: Fri, 15 Apr 2022 19:08:39 +0530
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: Alexander Lobakin <alobakin@pm.me>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Dmitrii Dolgov <9erthalion6@gmail.com>,
	Quentin Monnet <quentin@isovalent.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Chenbo Feng <fengc@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Daniel Wagner <daniel.wagner@bmw-carit.de>,
	Thomas Graf <tgraf@suug.ch>,
	Ong Boon Leong <boon.leong.ong@intel.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next 05/11] samples: bpf: use host bpftool to
 generate vmlinux.h, not target
Message-ID: <20220415133839.y6tjf3ymbvbrntx4@apollo.legion>
References: <20220414223704.341028-1-alobakin@pm.me>
 <20220414223704.341028-6-alobakin@pm.me>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414223704.341028-6-alobakin@pm.me>

On Fri, Apr 15, 2022 at 04:15:50AM IST, Alexander Lobakin wrote:
> Use the host build of bpftool (bootstrap) instead of the target one
> to generate vmlinux.h/skeletons for the BPF samples. Otherwise, when
> host != target, samples compilation fails with:
>
> /bin/sh: line 1: samples/bpf/bpftool/bpftool: failed to exec: Exec
> format error
>
> Fixes: 384b6b3bbf0d ("samples: bpf: Add vmlinux.h generation support")
> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
> ---

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

>  samples/bpf/Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index 97203c0de252..02f999a8ef84 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -291,12 +291,13 @@ $(LIBBPF): $(wildcard $(LIBBPF_SRC)/*.[ch] $(LIBBPF_SRC)/Makefile) | $(LIBBPF_OU
>
>  BPFTOOLDIR := $(TOOLS_PATH)/bpf/bpftool
>  BPFTOOL_OUTPUT := $(abspath $(BPF_SAMPLES_PATH))/bpftool
> -BPFTOOL := $(BPFTOOL_OUTPUT)/bpftool
> +BPFTOOL := $(BPFTOOL_OUTPUT)/bootstrap/bpftool
>  $(BPFTOOL): $(LIBBPF) $(wildcard $(BPFTOOLDIR)/*.[ch] $(BPFTOOLDIR)/Makefile) | $(BPFTOOL_OUTPUT)
>  	    $(MAKE) -C $(BPFTOOLDIR) srctree=$(BPF_SAMPLES_PATH)/../../ \
>  		OUTPUT=$(BPFTOOL_OUTPUT)/ \
>  		LIBBPF_OUTPUT=$(LIBBPF_OUTPUT)/ \
> -		LIBBPF_DESTDIR=$(LIBBPF_DESTDIR)/
> +		LIBBPF_DESTDIR=$(LIBBPF_DESTDIR)/ \
> +		bootstrap
>
>  $(LIBBPF_OUTPUT) $(BPFTOOL_OUTPUT):
>  	$(call msg,MKDIR,$@)
> --
> 2.35.2
>
>

--
Kartikeya

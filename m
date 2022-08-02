Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52097F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 08:52:29 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id uj29so11607326ejc.0
        for <llvm@lists.linux.dev>; Tue, 02 Aug 2022 01:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc;
        bh=47uliyErnA8e09JF9HO7R5O/EfooUkx1RpBi+CvBMiE=;
        b=gESk1Z8YO4csPW88/Rem8zWlU9ajVumN1NuZOqjSerOtIkAXrYHQ56cZkR7UgStNo3
         UXsYDEunPb/uP3sFHLlZIBP551F0pHQ6e9R7TtH84bimUs+83hurokCsTGckUcGG+i1F
         Qxpfh/Ag4uliVOneoUqqH2NEKFPVnFG1yE9OxoL01e/CMSwX6zyhoMotKKQ8B1l8H1DL
         riTjB5SyJT6OcgwwZu6aQ53S+eCsj8dx6hriN1rLvjv3OHOLxDxW4VKaAaWHCbS3nvzi
         SwV63szdMEsLfY/I8yu3NF81q7/kTU4xAHAl/qEoXBhsD8y32gGUvN0rlaFgeT+/QriZ
         gi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc;
        bh=47uliyErnA8e09JF9HO7R5O/EfooUkx1RpBi+CvBMiE=;
        b=AHBSg3elXGQsjLIWw40gstwFWOzmVyJwh2bnwhaJ1lA32V+hJF7rDYMMfcZLujBMoy
         xiQaUxHbkCjO9PEEtriLYXapN2e7usrFNayGLF97cX+lKTwQrIGyimd4C3zLkHrLFx+1
         45ttNXtP8mcb+7L2xiLpvtMMY798zHffj8txb+2XZOodUvqJCTFp/clMAgCEjO6/QEMR
         k7PjiThmIgoHay30LG7iQL9Yk5MBXZ7CMVGh28aLmVOneeOJykir46lmUH8Cu4IM02KB
         G3TwjsfGgtPVwGdo9crv+/1Wu9Gh4uZAd1Kkz+CY2bitkqk1yt8mPXgjHZ03EMj2PLjy
         xiOQ==
X-Gm-Message-State: AJIora8VL0BFY11Bz0A2nzmylh2A9/56+RRKSYoZmW9GYLswpj7AHrdM
	N9bN/lyVmncMjB1YMzUv2N4=
X-Google-Smtp-Source: AGRyM1smCNL1iF4wy+Op8u1PgSKXaUmky0EFr5tCCngDNbWaVuraIOTO4OFSsjBUoXvfgrpEsPLvmQ==
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id f17-20020a1709063f5100b0071239458c0dmr14894052ejj.302.1659430347780;
        Tue, 02 Aug 2022 01:52:27 -0700 (PDT)
Received: from krava ([83.240.61.12])
        by smtp.gmail.com with ESMTPSA id n16-20020a170906841000b0072aa009aa68sm3201297ejx.36.2022.08.02.01.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 01:52:27 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Aug 2022 10:52:25 +0200
To: David Faust <david.faust@oracle.com>
Cc: Jiri Olsa <olsajiri@gmail.com>,
	James Hilliard <james.hilliard1@gmail.com>, bpf@vger.kernel.org,
	"Jose E . Marchesi" <jose.marchesi@oracle.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] libbpf: skip empty sections in
 bpf_object__init_global_data_maps
Message-ID: <YujlyZevj6RDoOR6@krava>
References: <20220731232649.4668-1-james.hilliard1@gmail.com>
 <Yug2iYQyd0TNlnHW@krava>
 <2dbffe19-6b28-2ce6-b367-960f2250a12a@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dbffe19-6b28-2ce6-b367-960f2250a12a@oracle.com>

On Mon, Aug 01, 2022 at 03:21:58PM -0700, David Faust wrote:
> 
> 
> On 8/1/22 13:24, Jiri Olsa wrote:
> > On Sun, Jul 31, 2022 at 05:26:49PM -0600, James Hilliard wrote:
> >> The GNU assembler generates an empty .bss section. This is a well
> >> established behavior in GAS that happens in all supported targets.
> >>
> >> The LLVM assembler doesn't generate an empty .bss section.
> >>
> >> bpftool chokes on the empty .bss section.
> >>
> >> Additionally in bpf_object__elf_collect the sec_desc->data is not
> >> initialized when a section is not recognized. In this case, this
> >> happens with .comment.
> >>
> >> So we must check that sec_desc->data is initialized before checking
> >> if the size is 0.
> > 
> > oops David send same change but I asked him to move the check
> > to bpf_object__elf_collect [1] .. but with your explanation this
> > fix actualy looks fine to me
> 
> FWIW, I only just got back to actually making that change. This
> patch has a much better explanation than the one I sent so +1 from
> me also

thanks, I'm acking this one then

Acked-by: Jiri Olsa <jolsa@kernel.org>

jirka

> 
> David
> 
> > 
> > jirka
> > 
> > 
> > [1] https://lore.kernel.org/bpf/YuKaFiZ+ksB5f0Ye@krava/
> > 
> >>
> >> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >> Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
> >> ---
> >>  tools/lib/bpf/libbpf.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> >> index 50d41815f431..77e3797cf75a 100644
> >> --- a/tools/lib/bpf/libbpf.c
> >> +++ b/tools/lib/bpf/libbpf.c
> >> @@ -1642,6 +1642,10 @@ static int bpf_object__init_global_data_maps(struct bpf_object *obj)
> >>  	for (sec_idx = 1; sec_idx < obj->efile.sec_cnt; sec_idx++) {
> >>  		sec_desc = &obj->efile.secs[sec_idx];
> >>  
> >> +		/* Skip recognized sections with size 0. */
> >> +		if (sec_desc->data && sec_desc->data->d_size == 0)
> >> +			continue;
> >> +
> >>  		switch (sec_desc->sec_type) {
> >>  		case SEC_DATA:
> >>  			sec_name = elf_sec_name(obj, elf_sec_by_idx(obj, sec_idx));
> >> -- 
> >> 2.34.1
> >>

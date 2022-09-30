Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8E3200
	for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 20:55:16 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id s30so3811865eds.1
        for <llvm@lists.linux.dev>; Fri, 30 Sep 2022 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1K6Q0nQ5Q42g4z04WoQRYtpfm67biYFm2mWxuvCIHOg=;
        b=SlpVM0+LZ62XFANK16bQHLbikjK/JqKERbC2w9AnTEhvLIhcRRxnIsBQtmz9zQX3ob
         9h9dhCl6G4vLD8wsvGMaKJwVRoxGsPo5O5RFxmlLOvZKMdrAAWLyTghBzlhUsSKO6Gz2
         YWMhzPJTiaVo5I806ggo7ejuMMWpM6txhgt+duAy2Dh5aGpT+ApCh/NWZ8w+hg4PkIAE
         mWA+kLNtirYohN88y4+G5/LgmrPYAEUq40gG7VYx2xcZYlkx/Cm0hTSrJwcTlOhB0K+z
         kXeNFUZ1Bj7um2axCBiBEFXA2DfaYQYtu+6rUbZbsO9FziviHfyxIRfGD60/YGY42EVd
         LoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1K6Q0nQ5Q42g4z04WoQRYtpfm67biYFm2mWxuvCIHOg=;
        b=sxxU0IyoZO9j1miWjT+w4/w+42Zo71i/zA4iM9m+YNhFaUz0R4ZyAoAxURkq6ou15r
         c/UEUg6z52stt/CAd4BymS4c75spqYIW7IGrTMM4qj/IFdzAbS078xDXbmvWFYqBgM6T
         yYUkaX2lBtfDiTKODOn7EsF8K2C928bve6d1DHBnIRZqudCa76rCy1iQsG5t37HGhVqQ
         ba/LjU1raA8rdsA2Y7bBUd054ribsj1oSTPvjpy9s0kZI9g5OQKEoJw/F/PRdxeOe8Xz
         pqm2kiSxlNa6EUfLWmabGbEZtwyz1Zq+sdeY4jEWzrSd9719zwsLPfE7KqYgbkWbpKfb
         U7tQ==
X-Gm-Message-State: ACrzQf2Nk48CRLBZDrLxGriolCWEH6Z+CTOHOW1qHo3MoANR9NKE7dSZ
	j7sC6tHMTFCwrKnRuH7TM+2txzMOJSBQmpXviR4=
X-Google-Smtp-Source: AMsMyM4w21D6+g+NYtAd21bjoLgpQkIkbF1JRstbzPza0hG03AHTy30/AcEhExNWT9pCsjRE6y0WIA0pR5dFurG2icU=
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id
 y5-20020a50eb05000000b00457c6f55f65mr9082580edp.311.1664571314648; Fri, 30
 Sep 2022 13:55:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1664277676-2228-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1664277676-2228-1-git-send-email-wangyufen@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Sep 2022 13:55:02 -0700
Message-ID: <CAEf4BzaBPpZvxD6sDMWWRXVqKYTgwaxsggye0CRbv7q5_4jrPA@mail.gmail.com>
Subject: Re: [bpf-next v7 1/3] bpftool: Add auto_attach for bpf prog load|loadall
To: Wang Yufen <wangyufen@huawei.com>
Cc: quentin@isovalent.com, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	hawk@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 27, 2022 at 4:00 AM Wang Yufen <wangyufen@huawei.com> wrote:
>
> Add auto_attach optional to support one-step load-attach-pin_link.
>
> For example,
>    $ bpftool prog loadall test.o /sys/fs/bpf/test autoattach
>
>    $ bpftool link
>    26: tracing  name test1  tag f0da7d0058c00236  gpl
>         loaded_at 2022-09-09T21:39:49+0800  uid 0
>         xlated 88B  jited 55B  memlock 4096B  map_ids 3
>         btf_id 55
>    28: kprobe  name test3  tag 002ef1bef0723833  gpl
>         loaded_at 2022-09-09T21:39:49+0800  uid 0
>         xlated 88B  jited 56B  memlock 4096B  map_ids 3
>         btf_id 55
>    57: tracepoint  name oncpu  tag 7aa55dfbdcb78941  gpl
>         loaded_at 2022-09-09T21:41:32+0800  uid 0
>         xlated 456B  jited 265B  memlock 4096B  map_ids 17,13,14,15
>         btf_id 82
>
>    $ bpftool link
>    1: tracing  prog 26
>         prog_type tracing  attach_type trace_fentry
>    3: perf_event  prog 28
>    10: perf_event  prog 57
>
> The autoattach optional can support tracepoints, k(ret)probes,
> u(ret)probes.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---

For next revision, please also attach cover letter describing the
overall goal of the patch set (and that's where the version log
between revisions is put as well).


> v6 -> v7: add info msg print and update doc for the skip program
> v5 -> v6: skip the programs not supporting auto-attach,
>           and change optional name from "auto_attach" to "autoattach"
> v4 -> v5: some formatting nits of doc
> v3 -> v4: rename functions, update doc, bash and do_help()
> v2 -> v3: switch to extend prog load command instead of extend perf
> v2: https://patchwork.kernel.org/project/netdevbpf/patch/20220824033837.458197-1-weiyongjun1@huawei.com/
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20220816151725.153343-1-weiyongjun1@huawei.com/
>  tools/bpf/bpftool/prog.c | 81 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 79 insertions(+), 2 deletions(-)
>

[...]

Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC41808
	for <llvm@lists.linux.dev>; Fri,  9 Sep 2022 11:38:12 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so4242381wmk.3
        for <llvm@lists.linux.dev>; Fri, 09 Sep 2022 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=84NGXoD+siLqQfDBPyHWMFsUfPe+akx9hJwN05YInGU=;
        b=5VO91He75j4orh0w15oGO28lWGu/BzWTydVz0VppX4FrYx5vQUjTvqpgu/lwFvCzjU
         ajXtM/En0mPjpyE15wtpLjfUptFj6kEx/O1EikHJkL9ScHbkY/TaCXaxUyGkSsYAwPq/
         fJsywVsRjhafEhqbC+o4kzQhNJb5xw/idfJTeujfHYO5+wi9cYQb6QKfdUyZ+aNebd1/
         aK6fRJCuRPPeuRqJj144NGSDqff/hc8G6kpbfD8nuNeIZKcVnUcodMuht6wxiECk8dBv
         kqxJduyc7FzbzIEsJC5xjLVTjN7I3HM+dQ65u2fHsdixONoYULtwEe6s3BAhL2LBQGTb
         eyeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=84NGXoD+siLqQfDBPyHWMFsUfPe+akx9hJwN05YInGU=;
        b=TcLH5PBGtH2hCsN+rK3xQXI7Y2f/uM65v2+jLl7ahzO+k0QAKoXRxgN1ooG+ugzw+y
         e0YLdvbDZaHwR75X2vVJpNUdRhCZW9zNuyOR5uIlz69ek5EA3Z+KlY9CRDK6cWfDxYEs
         0qeozGXvshDc0TFdSFJ6cWq70ljCBVWa3hRsVZ6oTpXWSCfmra2Lw6jUxCt4XscSTjLa
         8uwM9zyW9Yy5UfuFF+s9apgCI+0KdcrMAUevASYKOIlJF72neBzS8U1aYbXuomVdYn9s
         76wnXs67mQEtvjwnehZprGL+nOpx8Ztke7UaJDlhg3E6UXTgDLXcCcEOnr1FypEQz8UQ
         oMIQ==
X-Gm-Message-State: ACgBeo096wfV5sroZ5tq2G9pfPKZKINXfq/AaCELijGeTjB2jMHlQOUz
	MfuaGHngDIfg2kcbxTe7SpgISQ==
X-Google-Smtp-Source: AA6agR7VwZ2DkQWvnjj3EsVyS8g8kjr0MD/4/p4leojeDBq/Lgg5vjkpl+LzEtbqBCE9jLkAnEoGlQ==
X-Received: by 2002:a05:600c:348d:b0:3a6:b4e:ff6d with SMTP id a13-20020a05600c348d00b003a60b4eff6dmr4904787wmq.95.1662723490285;
        Fri, 09 Sep 2022 04:38:10 -0700 (PDT)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c350800b003a608d69a64sm450511wmq.21.2022.09.09.04.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 04:38:09 -0700 (PDT)
Message-ID: <f0d30049-72b1-0f54-8f2f-fd47e75f71c9@isovalent.com>
Date: Fri, 9 Sep 2022 12:38:08 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [bpf-next v3 1/2] bpftool: Add auto_attach for bpf prog
 load|loadall
Content-Language: en-GB
To: Wang Yufen <wangyufen@huawei.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev
References: <1662702807-591-1-git-send-email-wangyufen@huawei.com>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <1662702807-591-1-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2022 06:53, Wang Yufen wrote:
> Add auto_attach optional to support one-step load-attach-pin_link.
> 
> For example,
>    $ bpftool prog loadall test.o /sys/fs/bpf/test auto_attach
> 
>    $ bpftool link
>    26: tracing  name test1  tag f0da7d0058c00236  gpl
>    	loaded_at 2022-09-09T21:39:49+0800  uid 0
>    	xlated 88B  jited 55B  memlock 4096B  map_ids 3
>    	btf_id 55
>    28: kprobe  name test3  tag 002ef1bef0723833  gpl
>    	loaded_at 2022-09-09T21:39:49+0800  uid 0
>    	xlated 88B  jited 56B  memlock 4096B  map_ids 3
>    	btf_id 55
>    57: tracepoint  name oncpu  tag 7aa55dfbdcb78941  gpl
>    	loaded_at 2022-09-09T21:41:32+0800  uid 0
>    	xlated 456B  jited 265B  memlock 4096B  map_ids 17,13,14,15
>    	btf_id 82
> 
>    $ bpftool link
>    1: tracing  prog 26
>    	prog_type tracing  attach_type trace_fentry
>    3: perf_event  prog 28
>    10: perf_event  prog 57
> 
> The auto_attach optional can support tracepoints, k(ret)probes,
> u(ret)probes.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>

Thanks, looks better! I just have some minor comments, please see inline
below.

> ---
> v2 -> v3: switch to extend prog load command instead of extend perf
> v2: https://patchwork.kernel.org/project/netdevbpf/patch/20220824033837.458197-1-weiyongjun1@huawei.com/
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20220816151725.153343-1-weiyongjun1@huawei.com/
>  tools/bpf/bpftool/prog.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 74 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
> index c81362a..853a73e 100644
> --- a/tools/bpf/bpftool/prog.c
> +++ b/tools/bpf/bpftool/prog.c
> @@ -1453,6 +1453,68 @@ static int do_run(int argc, char **argv)
>  	return ret;
>  }
>  
> +static int
> +do_prog_attach_pin(struct bpf_program *prog, const char *path)

Can we rename this function please? The pattern "do_...()" looks like
one of the names for the functions we use for the subcommands via the
struct cmd. Maybe auto_attach_program()?

> +{
> +	struct bpf_link *link = NULL;

Nit: No need to initialise link

> +	int err;
> +
> +	link = bpf_program__attach(prog);
> +	err = libbpf_get_error(link);
> +	if (err)
> +		return err;
> +
> +	err = bpf_link__pin(link, path);
> +	if (err) {
> +		bpf_link__destroy(link);
> +		return err;
> +	}
> +	return 0;
> +}
> +
> +static int pathname_concat(const char *path, const char *name, char *buf)
> +{
> +	int len;
> +
> +	len = snprintf(buf, PATH_MAX, "%s/%s", path, name);
> +	if (len < 0)
> +		return -EINVAL;
> +	else if (len >= PATH_MAX)

Nit: "else" not necessary, you returned if len < 0.

> +		return -ENAMETOOLONG;
> +
> +	return 0;
> +}
> +
> +static int
> +do_obj_attach_pin_programs(struct bpf_object *obj, const char *path)

Same, can we rename this function please?

> +{
> +	struct bpf_program *prog;
> +	char buf[PATH_MAX];
> +	int err;
> +
> +	bpf_object__for_each_program(prog, obj) {
> +		err = pathname_concat(path, bpf_program__name(prog), buf);
> +		if (err)
> +			goto err_unpin_programs;
> +
> +		err = do_prog_attach_pin(prog, buf);
> +		if (err)
> +			goto err_unpin_programs;
> +	}
> +
> +	return 0;
> +
> +err_unpin_programs:
> +	while ((prog = bpf_object__prev_program(obj, prog))) {
> +		if (pathname_concat(path, bpf_program__name(prog), buf))
> +			continue;
> +
> +		bpf_program__unpin(prog, buf);
> +	}
> +
> +	return err;
> +}
> +
>  static int load_with_options(int argc, char **argv, bool first_prog_only)
>  {
>  	enum bpf_prog_type common_prog_type = BPF_PROG_TYPE_UNSPEC;
> @@ -1464,6 +1526,7 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
>  	struct bpf_program *prog = NULL, *pos;
>  	unsigned int old_map_fds = 0;
>  	const char *pinmaps = NULL;
> +	bool auto_attach = false;
>  	struct bpf_object *obj;
>  	struct bpf_map *map;
>  	const char *pinfile;
> @@ -1583,6 +1646,9 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
>  				goto err_free_reuse_maps;
>  
>  			pinmaps = GET_ARG();
> +		} else if (is_prefix(*argv, "auto_attach")) {
> +			auto_attach = true;
> +			NEXT_ARG();
>  		} else {
>  			p_err("expected no more arguments, 'type', 'map' or 'dev', got: '%s'?",
>  			      *argv);
> @@ -1692,14 +1758,20 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
>  			goto err_close_obj;
>  		}
>  
> -		err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
> +		if (auto_attach)
> +			err = do_prog_attach_pin(prog, pinfile);
> +		else
> +			err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
>  		if (err) {
>  			p_err("failed to pin program %s",
>  			      bpf_program__section_name(prog));
>  			goto err_close_obj;
>  		}
>  	} else {
> -		err = bpf_object__pin_programs(obj, pinfile);
> +		if (auto_attach)
> +			err = do_obj_attach_pin_programs(obj, pinfile);
> +		else
> +			err = bpf_object__pin_programs(obj, pinfile);
>  		if (err) {
>  			p_err("failed to pin all programs");
>  			goto err_close_obj;

Please update the usage string in do_help() at the end of the file.

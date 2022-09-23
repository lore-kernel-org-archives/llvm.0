Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772894434
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 21:30:09 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id sb3so3176133ejb.9
        for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 14:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ww+rniqhu9NFGDOvfC2Yy/m/fFm7UdkBwQIJUqQ5qmM=;
        b=jtBwsA0aXXgjW9H5yKVw0u7FPvlQKv4SEs3GfZ/vNdSZU7rIl5UJc12xFGDdhxKxXZ
         9WOnWQ9XNHZCOEisBNKoVOxOQRBf3BtrDz1hPXjf9sAMsW31ZmJ/1td8yuaKYMMZIkaT
         ZJsOTtcEuD7FxevXLj2HdEgLI9RqpDSQtUsTcy9H5ma2BZZwNmqCfcptVo0hxqCHQuFV
         qskagxH5dMlzv0FUaoDSDzsI4y9SL8JapzTNuDMr2o8zpIV9jEo7j+cyHKEBbgt0kc6e
         eOIQXoWZdM7qVomOXDEQWjHMw5DxOeuBQBEnHcKFcT+isHx0MGmdTWqIPUcQJSLC3mR3
         KRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ww+rniqhu9NFGDOvfC2Yy/m/fFm7UdkBwQIJUqQ5qmM=;
        b=cVgz2pvrCz8wodXu0c7HwVR79z9QE2gP8FPeQx7/MUVrbOARvoHMgDwUh991j3bCuy
         CxQ2wcNlFFwQmwqGyb3jKODlXaNCipye1yGCz0pSRyRc8jYO5DmWTjViYvRLOmkIjHPD
         gTXq8Tn6ZUwJFAMYOaLcV6z9qlL/KmmYgeRW9XUg/O8L6au1qVUYujlagn7N/zPLsNw9
         i0ICtiL1N2QRPT9HK1saBoAclqQ+U+orpfTF8pzDIZ21gbUiCQriyyHLgyangw6MdBB+
         NhD65CPpRyLT1/fbDR9+SLaVzHfG2f3PmNKyLWcL1pnLDgKENJWdIBTsTypDueTQTwS4
         e91Q==
X-Gm-Message-State: ACrzQf2yJ0ryguVNEUfVxzh0ssRKEEOY9FqhMHFT6y8T63OqOfZtcHiA
	FHr/dLTmBIx+Y/hWoS6mbkMFPxkTScv7uDOJzDs=
X-Google-Smtp-Source: AMsMyM7wbUGGCdyhs/80nM8dSUGFoHeIlKdp58rzR0+BXa0pRZNFVgZ8YOo+ZRr8tHq0Cv8I/O56WLqPGcN8N6lh/HM=
X-Received: by 2002:a17:907:984:b0:77f:4d95:9e2f with SMTP id
 bf4-20020a170907098400b0077f4d959e2fmr9070827ejc.176.1663968607591; Fri, 23
 Sep 2022 14:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1663747240-31210-1-git-send-email-wangyufen@huawei.com>
In-Reply-To: <1663747240-31210-1-git-send-email-wangyufen@huawei.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 23 Sep 2022 14:29:56 -0700
Message-ID: <CAEf4Bzaskw74UeufRgKSbGtk5eybD9J+4keAPYb-u=jb5myLjw@mail.gmail.com>
Subject: Re: [bpf-next v5 1/3] bpftool: Add auto_attach for bpf prog load|loadall
To: Wang Yufen <wangyufen@huawei.com>
Cc: quentin@isovalent.com, ast@kernel.org, daniel@iogearbox.net, 
	andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com, 
	haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	hawk@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 12:40 AM Wang Yufen <wangyufen@huawei.com> wrote:
>
> Add auto_attach optional to support one-step load-attach-pin_link.
>
> For example,
>    $ bpftool prog loadall test.o /sys/fs/bpf/test auto_attach
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
> The auto_attach optional can support tracepoints, k(ret)probes,
> u(ret)probes.
>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> Reviewed-by: Quentin Monnet <quentin@isovalent.com>
> ---
> v4 -> v5: some formatting nits of doc
> v3 -> v4: rename functions, update doc, bash and do_help()
> v2 -> v3: switch to extend prog load command instead of extend perf
> v2: https://patchwork.kernel.org/project/netdevbpf/patch/20220824033837.458197-1-weiyongjun1@huawei.com/
> v1: https://patchwork.kernel.org/project/netdevbpf/patch/20220816151725.153343-1-weiyongjun1@huawei.com/
>  tools/bpf/bpftool/prog.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 75 insertions(+), 2 deletions(-)
>
> diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
> index c81362a..aea0b57 100644
> --- a/tools/bpf/bpftool/prog.c
> +++ b/tools/bpf/bpftool/prog.c
> @@ -1453,6 +1453,68 @@ static int do_run(int argc, char **argv)
>         return ret;
>  }
>
> +static int
> +auto_attach_program(struct bpf_program *prog, const char *path)
> +{
> +       struct bpf_link *link;
> +       int err;
> +
> +       link = bpf_program__attach(prog);
> +       err = libbpf_get_error(link);

nit: bpftool uses libbpf 1.0, so no need to use libbpf_get_error()
anymore, you can just check link for NULL and then look at errno


but I wanted to check on desired behavior here. BPF skeleton will skip
programs that can't be auto-attached because they are of the type that
can't be declaratively specified to be auto-attachable. For such
programs bpf_program__attach() will return -EOPNOTSUPP and libbpf's
skeleton_attach API will silently skip them. Should bpftool be
stricter about such programs here or should it follow BPF skeleton
approach?

> +       if (err)
> +               return err;
> +
> +       err = bpf_link__pin(link, path);
> +       if (err) {
> +               bpf_link__destroy(link);
> +               return err;
> +       }
> +       return 0;
> +}
> +
> +static int pathname_concat(const char *path, const char *name, char *buf)

you added buffer size in libbpf version of this function, maybe match
the same signature (I also moved buf and buf_sz to be first two args).

> +{
> +       int len;
> +
> +       len = snprintf(buf, PATH_MAX, "%s/%s", path, name);
> +       if (len < 0)
> +               return -EINVAL;
> +       if (len >= PATH_MAX)
> +               return -ENAMETOOLONG;
> +
> +       return 0;
> +}
> +
> +static int
> +auto_attach_programs(struct bpf_object *obj, const char *path)
> +{
> +       struct bpf_program *prog;
> +       char buf[PATH_MAX];
> +       int err;
> +
> +       bpf_object__for_each_program(prog, obj) {
> +               err = pathname_concat(path, bpf_program__name(prog), buf);
> +               if (err)
> +                       goto err_unpin_programs;
> +
> +               err = auto_attach_program(prog, buf);
> +               if (err)
> +                       goto err_unpin_programs;
> +       }
> +

would it be safer to first make sure that all programs are
auto-attached and then pin links?

also note that not all bpf_links returned by libbpf are actual links
in kernel (e.g., kprobe/tp bpf_link on older kernels).

> +       return 0;
> +
> +err_unpin_programs:
> +       while ((prog = bpf_object__prev_program(obj, prog))) {
> +               if (pathname_concat(path, bpf_program__name(prog), buf))
> +                       continue;
> +
> +               bpf_program__unpin(prog, buf);
> +       }
> +
> +       return err;
> +}
> +
>  static int load_with_options(int argc, char **argv, bool first_prog_only)
>  {
>         enum bpf_prog_type common_prog_type = BPF_PROG_TYPE_UNSPEC;
> @@ -1464,6 +1526,7 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
>         struct bpf_program *prog = NULL, *pos;
>         unsigned int old_map_fds = 0;
>         const char *pinmaps = NULL;
> +       bool auto_attach = false;
>         struct bpf_object *obj;
>         struct bpf_map *map;
>         const char *pinfile;
> @@ -1583,6 +1646,9 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
>                                 goto err_free_reuse_maps;
>
>                         pinmaps = GET_ARG();
> +               } else if (is_prefix(*argv, "auto_attach")) {
> +                       auto_attach = true;
> +                       NEXT_ARG();
>                 } else {
>                         p_err("expected no more arguments, 'type', 'map' or 'dev', got: '%s'?",
>                               *argv);
> @@ -1692,14 +1758,20 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
>                         goto err_close_obj;
>                 }
>
> -               err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
> +               if (auto_attach)
> +                       err = auto_attach_program(prog, pinfile);
> +               else
> +                       err = bpf_obj_pin(bpf_program__fd(prog), pinfile);
>                 if (err) {
>                         p_err("failed to pin program %s",
>                               bpf_program__section_name(prog));
>                         goto err_close_obj;
>                 }
>         } else {
> -               err = bpf_object__pin_programs(obj, pinfile);
> +               if (auto_attach)
> +                       err = auto_attach_programs(obj, pinfile);
> +               else
> +                       err = bpf_object__pin_programs(obj, pinfile);
>                 if (err) {
>                         p_err("failed to pin all programs");
>                         goto err_close_obj;
> @@ -2338,6 +2410,7 @@ static int do_help(int argc, char **argv)
>                 "                         [type TYPE] [dev NAME] \\\n"
>                 "                         [map { idx IDX | name NAME } MAP]\\\n"
>                 "                         [pinmaps MAP_DIR]\n"
> +               "                         [auto_attach]\n"

looking at "pinmaps" seems like "autoattach" would be more consistent
naming? Or just "attach"?

>                 "       %1$s %2$s attach PROG ATTACH_TYPE [MAP]\n"
>                 "       %1$s %2$s detach PROG ATTACH_TYPE [MAP]\n"
>                 "       %1$s %2$s run PROG \\\n"
> --
> 1.8.3.1
>

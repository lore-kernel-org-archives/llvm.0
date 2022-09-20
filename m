Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFFE7462
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 15:12:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g3so4744068wrq.13
        for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 08:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Edc5vm8+HRg8OvueT4HffnM8lhoUQsfY1q2oyUaLegM=;
        b=O0ko2PMRP4hSqwQ+T2uyZeknljuCg085maL0c/OFwwKxfUIgM23Tp/gpv9VSx0Sueh
         yhAwQ/pigKIYkkyYhQbPHlE3Ew6cvxQpCa5dDhu2+mjrRRPNf1SH8Km06aWjC6aydtE3
         l9Y4ygxtXGRxk3EMUQ4ge6qV/KOKaILoUikseuM4EEWMn/38LQ3bQAMbn9Ro/vDz/EnI
         oA5CPjQyNx+lwPwJsO+yOAE69qofPcxWjr1bxd6nlJHV8RsK0cTd3Z4HfbC0ucGVRKef
         RMMJ3yZlrNOK5IkjsZyaLD4rS/cEvI9dg6F8yX6zjaB4gxwLfaa9LXGRb/ffzkM0FjiX
         pvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Edc5vm8+HRg8OvueT4HffnM8lhoUQsfY1q2oyUaLegM=;
        b=mSZrew2GQoBtVgJLSqCfv3uP0YhsCU/0f1z28eoUZz/ZU4pzKp+jS42nyjOO91fBmO
         p7+gePqbt3/YXAJ744ETGhr606AQHttRsY6POqbNNl2extH3NT/6Jc4YF2MbTKjAuGjq
         7WqRZU2acnLphJtEPOdvxr0IE5UaUF/52mq4ziDSHNx2PH8M7GQlBlVSNGGYZXfBEuOo
         TrX+ni8C1EQxtcko0DDwoMXEI1XDjf9N6IaPKSIW1Pw02JVxnoZ5RTYqRqPf5uZayBsJ
         gKTTFRtKAIq7s/oQY3c0dA274aapwuPXrjhoPzQwFbaCbzzjAsNxvnTtkeqJYfbeTnJJ
         k4qA==
X-Gm-Message-State: ACrzQf2K0W0FgqhxQMeXxKnKXvxno+4fKPTLdgTOpwRVzhi+y5TLs287
	tmHdWHBQR+ee7fYS35n9Qbv3QA==
X-Google-Smtp-Source: AMsMyM4u7M8Oa3I0tiFWjywE/WPatGo9t8jr+6HvqPcpjnCsdmlW3DJa0sFe70cyd5vWJDPhvhUEkQ==
X-Received: by 2002:a5d:67ca:0:b0:228:7ad5:768f with SMTP id n10-20020a5d67ca000000b002287ad5768fmr14282120wrw.163.1663686746950;
        Tue, 20 Sep 2022 08:12:26 -0700 (PDT)
Received: from [192.168.178.32] ([51.155.200.13])
        by smtp.gmail.com with ESMTPSA id v10-20020a5d590a000000b002206203ed3dsm34079wrd.29.2022.09.20.08.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 08:12:26 -0700 (PDT)
Message-ID: <6bed1b34-3e92-2deb-94b5-9c194c6c7e6c@isovalent.com>
Date: Tue, 20 Sep 2022 16:12:25 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [bpf-next v4 2/3] bpftool: Update doc (add auto_attach to prog
 load)
Content-Language: en-GB
To: Wang Yufen <wangyufen@huawei.com>, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@google.com,
 haoluo@google.com, jolsa@kernel.org, davem@davemloft.net, kuba@kernel.org,
 hawk@kernel.org, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, llvm@lists.linux.dev
References: <1663037687-26006-1-git-send-email-wangyufen@huawei.com>
 <1663037687-26006-2-git-send-email-wangyufen@huawei.com>
From: Quentin Monnet <quentin@isovalent.com>
In-Reply-To: <1663037687-26006-2-git-send-email-wangyufen@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Tue Sep 13 2022 03:54:46 GMT+0100 (British Summer Time) ~ Wang Yufen
<wangyufen@huawei.com>
> Add auto_attach optional to prog load|loadall for supporting
> one-step load-attach-pin_link.
> 
> Signed-off-by: Wang Yufen <wangyufen@huawei.com>
> ---
>  tools/bpf/bpftool/Documentation/bpftool-prog.rst | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/bpf/bpftool/Documentation/bpftool-prog.rst b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
> index eb1b2a2..463f895 100644
> --- a/tools/bpf/bpftool/Documentation/bpftool-prog.rst
> +++ b/tools/bpf/bpftool/Documentation/bpftool-prog.rst
> @@ -31,7 +31,7 @@ PROG COMMANDS
>  |	**bpftool** **prog dump xlated** *PROG* [{**file** *FILE* | **opcodes** | **visual** | **linum**}]
>  |	**bpftool** **prog dump jited**  *PROG* [{**file** *FILE* | **opcodes** | **linum**}]
>  |	**bpftool** **prog pin** *PROG* *FILE*
> -|	**bpftool** **prog** { **load** | **loadall** } *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
> +|	**bpftool** **prog** { **load** | **loadall** } *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*] [**auto_attach**]
>  |	**bpftool** **prog attach** *PROG* *ATTACH_TYPE* [*MAP*]
>  |	**bpftool** **prog detach** *PROG* *ATTACH_TYPE* [*MAP*]
>  |	**bpftool** **prog tracelog**
> @@ -131,7 +131,7 @@ DESCRIPTION
>  		  contain a dot character ('.'), which is reserved for future
>  		  extensions of *bpffs*.
>  
> -	**bpftool prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*]
> +	**bpftool prog { load | loadall }** *OBJ* *PATH* [**type** *TYPE*] [**map** {**idx** *IDX* | **name** *NAME*} *MAP*] [**dev** *NAME*] [**pinmaps** *MAP_DIR*] [**auto_attach**]
>  		  Load bpf program(s) from binary *OBJ* and pin as *PATH*.
>  		  **bpftool prog load** pins only the first program from the
>  		  *OBJ* as *PATH*. **bpftool prog loadall** pins all programs
> @@ -150,6 +150,14 @@ DESCRIPTION
>  		  Optional **pinmaps** argument can be provided to pin all
>  		  maps under *MAP_DIR* directory.
>  
> +		  If **auto_attach** is specified program will be attached
> +		  before pin. 1)in that case, only the link (representing the program

"1)in" -> "In"

> +		  attached to its hook) is pinned, not the program as such, so the
> +		  path won't show in "bpftool prog show -f", only show in

Let's use markup instead of quotes around the commands please, **bpftool
prog show -f** and **bpftool link show -f** (below).

> +		  "bpftool link show -f", and 2)this only works when bpftool (libbpf)

", and 2)this..." -> ". Also, this..."

> +		  is able to infer all necessary information from the object file,
> +		  in particular, it's not supported for all program types.
> +
>  		  Note: *PATH* must be located in *bpffs* mount. It must not
>  		  contain a dot character ('.'), which is reserved for future
>  		  extensions of *bpffs*.

Apart from the formatting nits above, looks good, thank you.

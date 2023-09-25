Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CA21378
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 15:46:04 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4053cb57f02so54899945e9.1
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695656762; x=1696261562; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S6w9cjIBkaiBE4V+3VmCBqXcsiPNS3mk1iew76grX0s=;
        b=IUip8hOSKxLQTiQlcRChIQKa7P8MaWHSJCM7kCPQ3F1VadgFoO54Vl7VCSw1js0gB0
         ghEf73Or3pUZgCNmhN08K/Yu4VSoS5VC1MU9gdOArrsh8tZVW9ZXTcyWLEHxyHPjJeDA
         Kyi1h3y9XsurQVx1zzv7FY5jiLpdShZI4twOFcKMQjlYR4fhjPKvRO2X0zjRKk7zlxNU
         NfoAri27kjocXeDw+kDZdeYpW7FDAYC7Sh9T1lhUaLY2adnI2iSKxeaFIwKA8x3Nu+Qk
         +gnMUjHo21sr4/s6t/KhSVovrVedH1x1TDoQ5e6tgbLn/4ax9TiywzKHcZmL/QZB+tNr
         xWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695656762; x=1696261562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6w9cjIBkaiBE4V+3VmCBqXcsiPNS3mk1iew76grX0s=;
        b=UP5ISa+M6LYqajN2ruc8dQiK3Co+p0qCBC7no7LMYU5eLZFFu0oyJs83+LgR3jcXDo
         yp8HhzX9qInPVXl2+Xfloy5yJW7uISC3sfkViKhjl8SD5L+cf7leE+FlsyEw5SIoEvK6
         QCui7FMZVLG4TQ2jgpkaX5oq39jnYiCJz0BpFMmnunwTnTtW3o8dcTlnR6CT5rnM9uSi
         3QYxXRULYGPPWAGvtQ3EPsUy5FJNWCJEkAexk3vpSNC6n0TBMkrBfj+PDGZVhiXfwQik
         TEIHrfhpcfYVrjKGGfLjL9GZPx81oH3nD7WviB4YbAyOCnQjCrDIK+UyEISwtE73RtZK
         ilLQ==
X-Gm-Message-State: AOJu0YyBiU3Slub0diAng3HmLi9Ama0tfsX3hexjFHl+xxNZRO83JVtM
	Xj0ExtX5VKSc7o/xq5iFaClbsfIh4rKEobBz7sFdbw==
X-Google-Smtp-Source: AGHT+IGu/9yAvMgyQo0GKRSxLjrvYvnLqQG1R7XDHQF//7461nbvcXHf0k5K8bPzmjA5KENtcUlC23HtIehGPhsqqnw=
X-Received: by 2002:a5d:424b:0:b0:31f:ea3d:f93 with SMTP id
 s11-20020a5d424b000000b0031fea3d0f93mr5883911wrr.40.1695656762384; Mon, 25
 Sep 2023 08:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230923053515.535607-1-irogers@google.com> <20230923053515.535607-3-irogers@google.com>
In-Reply-To: <20230923053515.535607-3-irogers@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 25 Sep 2023 08:45:51 -0700
Message-ID: <CAKwvOd=WbZfFnen8e_k_TgocQumfdM2sUiO1doh4gS_G_+=h6g@mail.gmail.com>
Subject: Re: [PATCH v1 02/18] gen_compile_commands: Sort output compile
 commands by file name
To: Ian Rogers <irogers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Yang Jihong <yangjihong1@huawei.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Ming Wang <wangming01@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Yanteng Si <siyanteng@loongson.cn>, Yuan Can <yuancan@huawei.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, James Clark <james.clark@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:35=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> Make the output more stable and deterministic.
>
> Signed-off-by: Ian Rogers <irogers@google.com>

Thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  scripts/clang-tools/gen_compile_commands.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-=
tools/gen_compile_commands.py
> index b43f9149893c..180952fb91c1 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -221,7 +221,7 @@ def main():
>                                       cmdfile, err)
>
>      with open(output, 'wt') as f:
> -        json.dump(compile_commands, f, indent=3D2, sort_keys=3DTrue)
> +        json.dump(sorted(compile_commands, key=3Dlambda x: x["file"]), f=
, indent=3D2, sort_keys=3DTrue)
>
>
>  if __name__ =3D=3D '__main__':
> --
> 2.42.0.515.g380fc7ccd1-goog
>


--=20
Thanks,
~Nick Desaulniers

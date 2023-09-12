Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE87A31
	for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 15:33:57 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41517088479so13199481cf.1
        for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694532836; x=1695137636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jn3gYV6z0mHJzWuz6G6eyUwdrkRbzHbTqw/XH7fEH4s=;
        b=YTz0gsCxblEiV5IIgiZcHgVuZ7Yd1SNtwl415TKMdia72Kgqwz/7td6K7FzTS1bCi9
         2uA0Zv7wqjb6KOSez84vcvf5YQ5BaNm0jw8C8Y2jkd/eRXAUrPhi1g2Ff2I+mU9tSOBm
         +zejZ3h7MoLmbMmZY5u9yTrEowJdsT2QLJRVisxSi44EOL4AkobBTeVs2LyUp2qMlj1F
         WFvhBl3yfuYFYH/pEQ9L+5JVXKMtjrHhmW2eC9NdRAKSMZSNAVGEtvV9+amD0vZjodZo
         G8XzNeHe4hRGR2DNMX51LSK4gYuXSrMrwBgMdFBFhhg3keR/c92jwrJ179iegYD5RDS1
         gl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694532836; x=1695137636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jn3gYV6z0mHJzWuz6G6eyUwdrkRbzHbTqw/XH7fEH4s=;
        b=VBzs/xeVR4bo05TnBlNi1CDs2ErgqL5lmUh4RNP82eusXs9pw4tbbAPA72FFpFOIR1
         O2UMAAilxUWrRHDljNCblC27jhE3nDaOx5Ww6v95Ri5EYF4nBWb2gsG7YRqJmP+wnsti
         Z0fPtrLJt3hMurYtdkU9QXRWVxF7/LfRCiRBYA/v2chC9lb5TuKmGfmRrdoM7Wg4i2H5
         VzgKPzYzfNpI0zfWCX2R8AK7/mXk7gthNdNHifD9E8jais5lE2LAMx4VkTHOduqNfgsW
         sgcdAjKaMtTa2xFClT49/hgIW5yfPu4tWuAlLctM3+iqglbM/f65+n7SfwTreViJvYZ2
         jzDg==
X-Gm-Message-State: AOJu0YwaJk1EcsJ0CbfcJT3xSE/WKYA8CzYs9/0z28nUCFtRj27GPc90
	VGHQKPLD5JmmIOa5Eld8UoCbto2qBgPVpCaWQXtKfA==
X-Google-Smtp-Source: AGHT+IE0Ca2qfQkE6enrGukSoNDCb1OXtuL9IDZszmjiWUcu3f+9cYN/mXNgIzl2i4wDmR90/hv9yYRTETUzcz21Ipg=
X-Received: by 2002:ad4:5d4b:0:b0:635:da80:e53a with SMTP id
 jk11-20020ad45d4b000000b00635da80e53amr4483115qvb.12.1694532836379; Tue, 12
 Sep 2023 08:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230912060801.95533-1-bgray@linux.ibm.com> <20230912060801.95533-2-bgray@linux.ibm.com>
In-Reply-To: <20230912060801.95533-2-bgray@linux.ibm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 12 Sep 2023 08:33:42 -0700
Message-ID: <CAKwvOdkP1uwU0Cq9541zf309tudfFdbu-10Xo3h+g07-k=Fg4A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] ia64: fix Python string escapes
To: Benjamin Gray <bgray@linux.ibm.com>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev, linux-pm@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Nathan Chancellor <nathan@kernel.org>, 
	Tom Rix <trix@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, 
	Todd E Brandt <todd.e.brandt@linux.intel.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 11, 2023 at 11:08=E2=80=AFPM Benjamin Gray <bgray@linux.ibm.com=
> wrote:
>
> Python 3.6 introduced a DeprecationWarning for invalid escape sequences.
> This is upgraded to a SyntaxWarning in Python 3.12, and will eventually
> be a syntax error.
>
> Fix these now to get ahead of it before it's an error.
>
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/ia64/scripts/unwcheck.py | 2 +-

Ard is proposing removing this script, along with the rest of the architect=
ure:
https://lore.kernel.org/linux-arch/20230911163129.3777603-2-ardb@google.com=
/

So this change can be dropped.

>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/ia64/scripts/unwcheck.py b/arch/ia64/scripts/unwcheck.p=
y
> index 9581742f0db2..adc24152d3b9 100644
> --- a/arch/ia64/scripts/unwcheck.py
> +++ b/arch/ia64/scripts/unwcheck.py
> @@ -21,7 +21,7 @@ if len(sys.argv) !=3D 2:
>
>  readelf =3D os.getenv("READELF", "readelf")
>
> -start_pattern =3D re.compile("<([^>]*)>: \[0x([0-9a-f]+)-0x([0-9a-f]+)\]=
")
> +start_pattern =3D re.compile(r"<([^>]*)>: \[0x([0-9a-f]+)-0x([0-9a-f]+)\=
]")
>  rlen_pattern  =3D re.compile(".*rlen=3D([0-9]+)")
>
>  def check_func (func, slots, rlen_sum):
> --
> 2.41.0
>


--=20
Thanks,
~Nick Desaulniers

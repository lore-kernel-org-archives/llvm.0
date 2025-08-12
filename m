Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275B82EAD06
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 10:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993395; cv=none; b=XXOlywVxjD5Qjlp/MYOC3GQ5Yxmh3cWM0MJH1rc28vVCciSPIY0eVQ3xOrBf0SesvkgquI2PyhTph+LJ+pUwo1HL9nwMt7IZvRR0AcN0orfsnJLrNvdxzTzhTUW8bBonUcKoCLp+H0qJp24EyNEMV8Ba+uxuFyeBUIfLfRkt79k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993395; c=relaxed/simple;
	bh=6P/aKqG7fY1LNdU4jwyXEd4Urbpceh+qKNGedxVIFJc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WnCFeESetBYKrXWZVS4EXusCvyiMsY/a8+7DCIGpCc3NsRHiQYaKIdJqQxfE97Ssh46uoHXOiLwyiTWwHdJx/S27tB3HrT45YfVQh1WCxwV170QzgH4B1S5H7pcP5rB+dYvkXql1yuRcX0Ch9E2QhjwnhD1+augwtTGbzLqh0FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuXSUUWl; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuXSUUWl"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2401b855635so39872655ad.2
        for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 03:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754993393; x=1755598193; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6P/aKqG7fY1LNdU4jwyXEd4Urbpceh+qKNGedxVIFJc=;
        b=IuXSUUWl7qbntTN9Ws6o3qg1xSZ7BEv0rsgpjMwZGApfJ+KkuVIC8cCE2QvtXVyaE+
         8n97asXwTaDLQkY0SnHfBOR3hPp8lAY9hauVvJz2BMrKMBvHpUd5okCjf8dYLkVuP6jf
         fS/YZUl6vuJT4SDjkXtde47fvzyX2TKz3ExM7mtZ4RXeUKjiWc9CmnwfpargIiw935nh
         1+mPuBDvnliSCCY76r+7cqvhoNq40tVySQq6vvB4UXdx1/AsvWbgaECxAnWlCUTnwBvr
         qhSedJUc3kgUgDahfKUMuzm1TyWjjLgG651z40FMv63DdDJbpp4uQ0goqpHYVF/xglth
         YyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754993393; x=1755598193;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6P/aKqG7fY1LNdU4jwyXEd4Urbpceh+qKNGedxVIFJc=;
        b=Oxh+Btti1/iAWAYhB/Gg7leGvZrd7beSt+YMu2bn/dUOQBg3LcfXioFBFkJNrVcI21
         cc029N5iCqbinL4/Zyi/7L4v8XCzhlXmKOJOyUyCcZvR8lJSj6fSZJ8RCbGwyxXV7QxN
         BEcEiovPqg6QKXznE8xQlnZ5PIVcW+GSHvYkXpa9mTKUI1ZYdH/fkgSA0eGdcg8HWS0G
         bd+DQ1Lh2YI3sTJ740bN13V3m74OuqIw+tra50GcNi/6nAoDVVcbIE5S+/I6MysUww9w
         3vXhVwteMee4B5/W7EEY5jDBr5wBKX9tKgnbXM75muOnHivWbUPADwtHwK6Q7+VydEZV
         bmRA==
X-Forwarded-Encrypted: i=1; AJvYcCX/yqVb+DuU/LNV69hQpzj2stwBAMilZ5MdAsB0wLlEBz4W6zumjqRGyEGHTmeKIoLxlVoY@lists.linux.dev
X-Gm-Message-State: AOJu0YxLzqp8ZeT6YdlJ88ITZfss5qwitsoWYqMBOVeBkf4Q25t2T5SJ
	1DwdRMrJCpncuM/bRTqPjTqoTuZY6xW5EJdYkKzq9zmF97om1WoeGpmK
X-Gm-Gg: ASbGnctHLsGozsC/GKz/OTCWPeO0mIhE9OJMB7PhXgKhWdozr+AV+nMLwg82Vw1lBiN
	k5A+x+kBl3gSYKGSInr4YHFg1Z8VsY1Vve9nzCuziKecIYX9PaS4SF5jIUgTbpbl43Q2CqEvAQe
	3SQMZkkCsfCEdi97yJoXNdA/qB/qAMEWkQQqWKEx+4T6GZPnuDFRneUSntv8yByI21OteG8sObd
	1o8n0rNq5LBju4551PidGcI2AUwYp/Xar3/ouWspMsWHVXmiwcJiIgJeZRI0caSM79yfe8DZAdV
	0H3QXWQwT/5TU3ro/JiW+n+EToDAaBMVSipTaVi5T2AHE/NvzEjRnvJ8erLa01VzH5ehmReKHnS
	hETRLJiDRDsvTY16dTzcXcjUPa9DNztE74mJ0dN+E5hqYMX05CfyFg2AJ8v4=
X-Google-Smtp-Source: AGHT+IGhpjBlFVCtqKifefIW582qoUXW/+MuMV6QaAxlQhCOTK745+twCA/BAAXtV9H+RzFvQWkZMg==
X-Received: by 2002:a17:902:e547:b0:242:9bc5:31a1 with SMTP id d9443c01a7336-242fc3d395emr36043155ad.57.1754993393248;
        Tue, 12 Aug 2025 03:09:53 -0700 (PDT)
Received: from smtpclient.apple (wf122-104.ust.hk. [175.159.122.104])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ce35sm16962338a91.29.2025.08.12.03.09.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Aug 2025 03:09:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH V2] scripts/checktransupdate.py: add support for scanning
 directory
From: Haoyang LIU <tttturtleruss@gmail.com>
In-Reply-To: <20250811212446.GA924610@ax162>
Date: Tue, 12 Aug 2025 18:09:38 +0800
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
 Yanteng Si <si.yanteng@linux.dev>,
 Alex Shi <alexs@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 hust-os-kernel-patches@googlegroups.com,
 linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <31217D41-748F-4528-B3C0-60CC5EB6833F@gmail.com>
References: <20250811170050.94997-1-tttturtleruss@gmail.com>
 <20250811212446.GA924610@ax162>
To: Nathan Chancellor <nathan@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)



> On 12 Aug 2025, at 05:24, Nathan Chancellor <nathan@kernel.org> wrote:
>=20
> Hi Haoyang,
>=20
> On Tue, Aug 12, 2025 at 01:00:50AM +0800, Haoyang LIU wrote:
>> Origin script can only accept a file as parameter, this commit =
enables
>> it to scan a directory.
>>=20
>> Usage example:
>> ./scripts/checktransupdate.py =
Documentation/translations/zh_CN/dev-tools
>>=20
>> Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
>> ---
>>=20
>> V1 -> V2: remove the fix of missing "f" in f-string and make it a new =
patch
>>=20
>> scripts/checktransupdate.py | 24 ++++++++++++++++++++++++
>> 1 file changed, 24 insertions(+)
>=20
> Thanks for the update. While this seems reasonable to me from a purely
> surface level glance over the actual Python, I have added the
> Documentation folks that Dongliang added from the previous thread, who
> really own and maintain this file (the original patch is at [1]). =
Please
> include them in future revisions should they be necessary. It would
> probably be good for something like this to be applied?
Hi Nathan
That makes sense. My V1 patch also missed Dongliang Mu and the other =
maintainers. Thanks for pointing it out.

Sincerely,
Haoyang
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..b7e3a8c8832e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7302,6 +7302,7 @@ P: =
Documentation/doc-guide/maintainer-profile.rst
> T: git git://git.lwn.net/linux.git docs-next
> F: Documentation/
> F: scripts/check-variable-fonts.sh
> +F: scripts/checktransupdate.py
> F: scripts/documentation-file-ref-check
> F: scripts/get_abi.py
> F: scripts/kernel-doc*
>=20
> [1]: =
https://lore.kernel.org/20250811170050.94997-1-tttturtleruss@gmail.com/
>=20
> Cheers,
> Nathan


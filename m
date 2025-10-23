Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5D9338590
	for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 15:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234169; cv=none; b=Vwe8q++WdVwndMq7h89teH184hZdpdFQcYAdZW4VDCWwA3cnb4swyre/v+wTGBp9w/H3FRZBdYauNEVNRtmYdcz7OV3ZpbBdI7wsJV8A7CCvYsY37geVziufT96hnl7NPrFRDiOZBToKgSHZwNX17UfLmgdoqw99zaLuSdZ9pPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234169; c=relaxed/simple;
	bh=q52XoYD9UMEeNWx8+kGq3GYFr3ugdoKh0p7BaDkyaVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kL5ggHkHgnEGlCrr3rs0+rcf0wk/MizpNc3oQKJup66kVde1BJoWwH8KKZPKCs9vPbSWrqCoj7I9QSUkKbrzMV4i1iGwT1ty1FoVQ42kUkFWS+X1NOxxIQCaWPVntKPMNDgoUGsAuDsPPsGDxo71BYFRTPNs3WkgtwwwtyWEMas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YgKCwcK0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgKCwcK0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-475c696ab23so5886315e9.1
        for <llvm@lists.linux.dev>; Thu, 23 Oct 2025 08:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761234166; x=1761838966; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q52XoYD9UMEeNWx8+kGq3GYFr3ugdoKh0p7BaDkyaVQ=;
        b=YgKCwcK0Q5XkOnlKbohXHvfQ9ifINLK/HVmyFg/M0hQL1GRcTqovzpuEUPPvNKznnr
         j1QKwTgP5BPcU267fLYsWryDC07WRaNq+NIAtXujN9rqy3rp/av3/PIYTA01RD2tFzhX
         zw14tg3g+sKRy915yhh7OVYjoml4rzsvvjeR82Ff0hWCIeuarovNMi9ftGrKHzGVMb72
         12ntAStPZpiEFt6hVxVvMtMPk20tlH2R5yOi0XgSrEi0RpbaIOnfXt+dJH756dRFBKLE
         FEyRXCI4hQ8mOXF44CpprQ118WDb4SyusNUqEl/bSYh45W2d/U/7fXe2BAmIAQ8tNK+0
         kFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234166; x=1761838966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q52XoYD9UMEeNWx8+kGq3GYFr3ugdoKh0p7BaDkyaVQ=;
        b=CJvQcOHlGFzBhQ56C2ChJF+xTGT6lq9ZZIITpNsoV97k2xKCHV1PAXUNSk8e35Bvld
         3yuiy3EpALGY9K0dnDumv0FpYQf6EgLPXtkdGCooX5qzU1cIUWgIKSrqEf1+vAzR2Zpl
         Ht7WUWcuX4Lcdl8HovQ8fjhlmqgies1tzaelvBvLQ/m0WfNAhBLgG7eR/TvuPwYF9TB+
         Nxq7PcQToJLI7Wy3klmTYGOTZdPuv5Dwd23va7nI9OxdHS/45JdCmZxEXOADbEHjyNep
         jHGyPF7Kgc+Q/3jbGOlC2LEylVKzaG8QCrmQWRmO+zJNY1sOhhGBme7ogaJyh+h1rs/c
         oC2w==
X-Forwarded-Encrypted: i=1; AJvYcCUpa64CFi3SlR4/nAb0r5x2ewPLWtVN7a6Cc/xMgnIhZMOwVr0qMv/S6HUWyuC0apRmJnZ+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw85P53tLMe8KUtdMZysa43ApxFkqXehYh3kSfl1IruVLh7vM0o
	hebuEX1kPDR/MhZ8BBMGZMB1u55EqXIUF/OIsZx7v67gbXmDDmTAAHZzvbiD2kPw+khal2DdoNf
	Q/LQLUGWT56mNRih91qgAeTE1VDl73jI=
X-Gm-Gg: ASbGnctLDwKeY6RfsW3EfazOlSEwbcO0FRBYP6LKXViJiVM3vdn7qrUKGWkI9fKvePy
	WPaLv8sz/eFwRa7h6cpMBettAHMj1XtiopAujRnlr3f59/OIHxQDshOaWgml6UARzJbKd4vmU+Z
	NXIZ6ZijFPNODMM0MpS9MmesW7i8PDog6UOtDY9EaHlW0j6vMefco3hdZJ9UzGQ9+BxdsCkZa0i
	VLv5Epvw5yGcXB1N8QRcRh9ZIx1JWar0AZFWMbK3+ewFdIbv5fQxRzKpk+XEusa3AjLWX6jmEVY
	Lzmroa63VMxI0MR1DS6VuA==
X-Google-Smtp-Source: AGHT+IFhow4QI7xwSMhlDLZ5U1ipuss1H6Ff92i8GV+W07OMa+jEx3VQ4ocR2Em4KUSzfNwGqYXyynb9DW8McUjIsPI=
X-Received: by 2002:a05:600c:37c7:b0:46d:3a07:73cd with SMTP id
 5b1f17b1804b1-4711790c31emr150922395e9.23.1761234165874; Thu, 23 Oct 2025
 08:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251022071825.238909-1-jiayuan.chen@linux.dev>
 <6aa7fafd-30b1-4605-8b80-4a158934218d@linux.dev> <0643875cea56f4e4fd78c7e9222b24e269136155@linux.dev>
 <84906f32-955d-4fda-b87d-56c052ddfd87@linux.dev> <8a94c764c5fa4ff04fa7dd69ed47fcdf782b814e@linux.dev>
In-Reply-To: <8a94c764c5fa4ff04fa7dd69ed47fcdf782b814e@linux.dev>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 23 Oct 2025 08:42:34 -0700
X-Gm-Features: AWmQ_blQXgPilzRH5-JKjp2M5ciDOClA5vPCYZnL9G8qXyDh5BpMORYPoCvzAh8
Message-ID: <CAADnVQKNpd8SCawQbW69ALWNZMoOvxwRbBQELqzh0P52iXG=kw@mail.gmail.com>
Subject: pahole next->master. Was: [PATCH bpf-next v1] selftests/bpf: Guard
 addr_space_cast code with __BPF_FEATURE_ADDR_SPACE_CAST
To: Jiayuan Chen <jiayuan.chen@linux.dev>, Alan Maguire <alan.maguire@oracle.com>, 
	Anton Protopopov <a.s.protopopov@gmail.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>, bpf <bpf@vger.kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Puranjay Mohan <puranjay@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 12:50=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>

>
> thanks, but version 1.30 didn't work in my tests - even pahole's master b=
ranch fails, only the next branch works...
>
>
> It seems that the 'old' pahole parses some kfuncs incorrectly, for exampl=
e bpf_dynptr_slice().

Alan,

the introduction of the 'next' branch screwed up the workflow for many peop=
le.
Let's remove it and merge everything into master.
People expect master branch to be the one where active development
is happening and the source of truth for the latest features.

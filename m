Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C002E62DC
	for <llvm@lists.linux.dev>; Sun,  1 Feb 2026 08:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769933867; cv=pass; b=HKrL52mRiuBHov7rIbS14xGbEPnXjqfL9VXnUjiCgT5Cc4hTfHvX0KOV9iGzctUOYrCwfhixq3B0XIud2uHGd5X9HGVsCPorh8G4RRppUCi8EpXk+SCPxtXHSTa9A7uufzFqVhmJOcDOkjBfGUKmsn1i2gA8JFSDtSW2d7RPjLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769933867; c=relaxed/simple;
	bh=3re9rxV/8dh5KL5dWJSWC+HvSoBzJ1kgExDXoj22Fd0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+NJBOIa8D7+rtnb1jgUZ0LkXy9yD/xv8A/vk8d3qI5xjNcFxgmuuBm5+xRL0AY7Ew0iYqb2xnK+GqUwYJK1kdN6E8OJ+Yvk8a41Rz7pfWDm/yA7Admv/3q9WaayxYrc8b8AzaObygl7fR4TQH8kYh/HV2aOWXV+WgwS1wJWUH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cFgsGSts; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cFgsGSts"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50146483bf9so40602261cf.3
        for <llvm@lists.linux.dev>; Sun, 01 Feb 2026 00:17:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769933864; cv=none;
        d=google.com; s=arc-20240605;
        b=Bx6TZ6eWwFyLk/WUnrgVgvNbU0qG7izuKZ+aegzHY8NUWhc/0FdCyQ0fGwMWUYWM+a
         E3hwqcNjkeKMej2eYJmCRqwhmFno+jMG0oXhT7DG8iCkFg7DFLIi1VxygKeGqd3GQHbm
         fP5ExcG4CCGhG6279GwnHV4J5WHzEX4eB1mtHBBDeSJV1JHwFwvEedngBCqMpkx8FRhx
         hQlzUF4Zf7VsaLyQIUnxb7JVkwYzhwRC+7dc96WGlMsJPUjjMG0lUZmOCP5+jAT2W107
         bX4O3RY4tZmjSPv5BoVV0f/V9J9Lq/vSQaZi5tzv5f3Yjf9cmue1XnOEWJIHQtEUKrDu
         2Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PB0m9gxhrqXIUqCxYwXzor327qBnTXWpH9xmdwbkgxQ=;
        fh=g3zuee6A0QAkl7j8wMYu79mp/XWf4yEr6Qrgg83GyKY=;
        b=d0ltbpYykZO9ODof+4UJUxi4X92hj9czbOOwNGtWslvuYHIG2rx7AOO/XuKq1QWRv5
         lSqAgVPJBZiP/P8UHbyXFlx2rX5NhInKYEu38gCH5Chkdmfds5CVGuDZ1RbSJXN+O3EJ
         IYhQ/B/6OxwhwJSCWYR+N5jSx4MGq9eFQOVS9s0SQ2SBY4yYkTWgWnCrliGF0CqtpUBP
         Q6jdc4KUxzpfaTt/E/pEzCZ+RGIETo5RHjNTi53Zfr36gcn6Xxf4EX7FJ+gJ+CxgNtng
         aoIjl2A0fmLxdF5i8YRWR+oT8DdYlSz0YnTi8fpplpNi4VoGoGH48UXCXfX8+uChJ6W7
         3cQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769933864; x=1770538664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB0m9gxhrqXIUqCxYwXzor327qBnTXWpH9xmdwbkgxQ=;
        b=cFgsGStsxKPlnpfw2xvMYkNLQDLD5mjFUlIQyls62IqclaFXwl4L2jdv3nf1ckUztS
         AVAve/QRSYyotXDfPgbJnit+eNL6hddTTisZhJyWAD6DfYqqw9iSarT5lPaNP5thfu7G
         Cxd1x5ct7i/LTjli4tl/LYBc+8sBUSQiWzVP01nAbbpNo1yNWrEw0m0SIFV1X+Gn0Kb6
         sHjb4oZzthLYSfqxxA/9ujwCHfoeGctISKBUYsh8KVEFBiOPAGbmwtW2h3fDdAWEzYIE
         zOfmPhtHppNYslfnf3IDbKQE/1s5SfSaKzEQrVjJkvMqdiqR1Q86rqrN5ZtVVGracT9Q
         iEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769933864; x=1770538664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PB0m9gxhrqXIUqCxYwXzor327qBnTXWpH9xmdwbkgxQ=;
        b=hCnxa53Yiz6VjeFDud8JVPm5a4fhDHDO/0TkIsctmdBg3lPHLDbAOYrWkhBwi2dtKi
         24NC05zxVgWd/tHmI/T5CPM4XZeHFu6WK8mKjPe+/otRB/z6u4jNuQMECsoCv24gaLWZ
         fjXHnTARqCjsnOsxL65+Z5kgS5wQEqf5gE2m3NZKhwa74J+cyXNBKeP8kXw8wOs70PC6
         aX2ChhHnQlrGVCEgTc8hJZJGIRR6HQUySdE6WvBSXIaIwe+rHUsfehjP2VR0uPTAQ8Mz
         7b06SJAwUW+5WXp2ipQP7NFHzyNZz2NPn/1dEFGzqdAePWZjHgokH4thk/TPOzmlRIyk
         L2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbb6kRPyt1EhPuvDHxVkieuLYAVpw1IL4CWrZRy7SaXr6dZNOBfCfCdRaShLjaSC8tczXh@lists.linux.dev
X-Gm-Message-State: AOJu0YyT1C8XI0AYz2o6Pk7sQSdv9b8GuIzfU6nOZXwJedMUndXCu1lH
	pJOY3fe6SNqf91CVF3djwU1qY3mH1WY7hfm4ZYW9C2TkddjJsjUpXZn9LO48ZSL8rDO7ZD/DlPt
	EF+SM3eiH/oOS0mjftfH0bRHfbXCIkCr0N7jFjCs5
X-Gm-Gg: AZuq6aJ8xLTTG4kinDLPd54ifDUjIN1elTVVy0e9mZRKj5OuP5QIf+Y6hliUxGCTAD+
	q+HDUMfU/0FmmbaDKrXe8LLssH1MPw6XzxGheYTnfhCSirm0M9+pSg7jcT5kuqPhfpD7NCaPb0/
	hWD7BvhsP2xh0WTAtuxuZB5slHB09/nDLvj4VD45tS4WYS6/WxcELPHVikZ7XehD/3zjxQ6GXj+
	frUqS9Zf9M2bYzY3m01cOQWdvhYILM52eQSrGaJ62RZFXxzqsPzQhkM5wfXV/QSWJ4iiHUMjdgn
	cb3Dlg==
X-Received: by 2002:ac8:7f49:0:b0:4ed:5f45:448a with SMTP id
 d75a77b69052e-505d212da0amr132861661cf.6.1769933864353; Sun, 01 Feb 2026
 00:17:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260131171627.1852894-1-edumazet@google.com> <202602010830.7VDNDITy-lkp@intel.com>
In-Reply-To: <202602010830.7VDNDITy-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 1 Feb 2026 09:17:33 +0100
X-Gm-Features: AZwV_Qhyp2z7W_bgyb2YmyDk-fm0N4Cut2JyNVHPhM_8aq_boW5IWNZ1Z4-S3EY
Message-ID: <CANn89i+5d1-HqBPwr2c5U0dFw7WGg9ZOc3mYD3GPtanzyyBaQQ@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: move __reqsk_free() out of line
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 1, 2026 at 1:18=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/tcp-m=
ove-__reqsk_free-out-of-line/20260201-011758
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260131171627.1852894-1-edumaze=
t%40google.com
> patch subject: [PATCH net-next] tcp: move __reqsk_free() out of line
> config: um-randconfig-001-20260201 (https://download.01.org/0day-ci/archi=
ve/20260201/202602010830.7VDNDITy-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9=
b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260201/202602010830.7VDNDITy-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602010830.7VDNDITy-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permis=
sions
>    /usr/bin/ld: net/core/request_sock.o: in function `reqsk_fastopen_remo=
ve':
> >> include/net/request_sock.h:137:(.ltext+0x103): undefined reference to =
`__reqsk_free'
>    clang: error: linker command failed with exit code 1 (use -v to see in=
vocation)
>
>
> vim +137 include/net/request_sock.h
>
> 9403cf23025880 Guillaume Nault  2019-03-19  133
> 1e2e01172fd11b Eric Dumazet     2015-03-12  134  static inline void reqsk=
_put(struct request_sock *req)
> 1e2e01172fd11b Eric Dumazet     2015-03-12  135  {
> 41c6d650f6537e Reshetova, Elena 2017-06-30  136         if (refcount_dec_=
and_test(&req->rsk_refcnt))
> c34506406dd5cf Eric Dumazet     2024-06-05 @137                 __reqsk_f=
ree(req);
> 1e2e01172fd11b Eric Dumazet     2015-03-12  138  }
> 1e2e01172fd11b Eric Dumazet     2015-03-12  139
>

Great, time to get rid of net/core/request_sock.c

I will send in V2 a series with these 3 patches before moving
__reqsk_free out of line.

commit a79b5cb06e365dc8d3e1fb4872ec861266306c14
Author: Eric Dumazet <edumazet@google.com>
Date:   Sun Feb 1 08:12:11 2026 +0000

    net: get rid of net/core/request_sock.c

    After DCCP removal, this file was not needed any more.

    Signed-off-by: Eric Dumazet <edumazet@google.com>

commit 58ab84ff63932e13f1c59aa45493333c04e6f4df
Author: Eric Dumazet <edumazet@google.com>
Date:   Sun Feb 1 08:08:40 2026 +0000

    tcp: move reqsk_fastopen_remove to net/ipv4/tcp_fastopen.c

    This function belongs to TCP stack, not to net/core/request_sock.c

    We get rid of the now empty request_sock.c n the following patch.

    Signed-off-by: Eric Dumazet <edumazet@google.com>

commit 1718fc81eb4742c1eab842852e600b906a08fded
Author: Eric Dumazet <edumazet@google.com>
Date:   Sun Feb 1 08:00:42 2026 +0000

    inet: move reqsk_queue_alloc() to net/ipv4/inet_connection_sock.c

    Only called once from inet_csk_listen_start(), it can be static.

    Signed-off-by: Eric Dumazet <edumazet@google.com>

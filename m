Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4333AF675
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 14:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276994; cv=none; b=Lg3o9jo/lA+afrIYJYCeiyZY+m5JhnOjSrkgzd+jznEnV2S1p3toovesUGRC4JWUq21xSKHsv4KBfccYJwYaGDrlmKo08ndu01x2XtB9TAqqn7HApQ5gcYh27N+bxc3TzHBREy9B8rscs2RXrAhOMV0bKlAj+kP3hfjAyySqJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276994; c=relaxed/simple;
	bh=JxlE8tyZrvnfbFBO0MpUGY0nImU77DWkxB9O0J/TiTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WH5iwwUm9sCt/YlDMAk2S/gWYkWbq4Vb3mvQtgmNdDrsX93vq9166PeaiKO6szqBjV6q9+ZptZEXbDNHOU3iBd0Hri1gYLHI0D7SOeW5cRUij9+75f6E8PgF76R4WV4aFeMq9KaGLIfn9NsxgC73lTotG6Sn7Tb+FZJkkhSHBRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GW62zH6j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GW62zH6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2827C2BCB6
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 14:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276994;
	bh=JxlE8tyZrvnfbFBO0MpUGY0nImU77DWkxB9O0J/TiTY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GW62zH6j3TfYSCWjR2VEDpFBOnjh6uHOzjLr52KLP8N1qc0Yq/keb4JpLlNx2mPLf
	 AocYXrJ9JRpOVY302SFAP26KQXR5hLjjqgk3/wrgCPrxBcd92PUZwq2D+LcvLhnBlL
	 LyETvh2jihzyLdPUJFRw8peqCivZbpDB6fLG2GOEV2+qUw5PPiW6fXqsjBY8QKuZ3B
	 QNO0/Bz17I6nE1ieeLkLiUF9VuYeTi/z7s/9lOpFWQUTeWJB+D/0R6hyaCEbgeF9Cq
	 egfV3vRlVcRa8S7wPYPOy7+2iog4190wwEvHWEOzegfHeHN3/M4vUYpMAlhaZypwfI
	 FWGJXZ5+AM2Ww==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so339040a12.1
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 07:43:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+yCT52GsQtqsIlEXlCNZ5oupm41HPoVp2QeeO6voPrgG7c1KGsULZKYSAt97Mr7Skems4@lists.linux.dev
X-Gm-Message-State: AOJu0YwvXZnZPOsP+Yo2yzho28i4Jtm5fZC85haAwJ2+J2LGnE6bL9QT
	Hyr2cF9Blm0US3P+PRD4DhKtoyUksXnmWd8VcGJKPI+QtZfz1olUPvknUZKJEW4eYfufuN6136S
	Ps1exNaW56osmFTOZsyCZKz8SDkaVzOg=
X-Received: by 2002:a05:6402:5287:b0:668:58b6:505c with SMTP id
 4fb4d7f45d1cf-668c9b3b2famr8559139a12.30.1774276993063; Mon, 23 Mar 2026
 07:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603180118.ClDWNtId-lkp@intel.com> <b859bfa1-7844-4b23-91a4-bbd526ffc19b@samba.org>
 <CAH2r5mvvjWtJza+9YrLYvneysyEQa5rENhTYiFTAwrE+KhOy8Q@mail.gmail.com>
In-Reply-To: <CAH2r5mvvjWtJza+9YrLYvneysyEQa5rENhTYiFTAwrE+KhOy8Q@mail.gmail.com>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Mon, 23 Mar 2026 23:43:00 +0900
X-Gmail-Original-Message-ID: <CAKYAXd_yLYLD5SsRUZy8d6u7vknTPuN8Cbe11HJt0Eq6bLzBBw@mail.gmail.com>
X-Gm-Features: AQROBzDEQtvFmOi3srkmFwcUQgteSrrJ0KUFogU3fX2lCQFsAO1qj222hHE8nqY
Message-ID: <CAKYAXd_yLYLD5SsRUZy8d6u7vknTPuN8Cbe11HJt0Eq6bLzBBw@mail.gmail.com>
Subject: Re: [samba-ksmbd:ksmbd-for-next-next 11/12] fs/smb/server/smb2pdu.c:5723:3:
 warning: variable 'pntsd' is uninitialized when used here
To: Steve French <smfrench@gmail.com>
Cc: Stefan Metzmacher <metze@samba.org>, Asim Viladi Oglu Manizada <manizada@pm.me>, kernel test robot <lkp@intel.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Steve French <stfrench@microsoft.com>, 
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 10:22=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
>
> looks like a simple fix to initialize it to null at declaration, right?
It seems this test was performed on an outdated version. The current
ksmbd-for-next already includes the updated one, so we don't need to
check it.
Thanks.

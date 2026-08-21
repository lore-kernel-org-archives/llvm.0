Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5493546C4
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787324650; cv=none; b=kjrkuCaNnamOPQiNwnoFC024k/0bAgNIG6QKE+YjQUsBmWXRZHsry7XmNqSj62+TdpOSDYx4XJRj0FwQvlRvXV4MEG6iEzXxoZ3FJUPL1G24PC1O2Q6VdFuY7XlMrkUDA1CjySt7vNl9GxxVxf5MI2H9o96QaQXexfurS+VDTvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787324650; c=relaxed/simple;
	bh=nOATZQ7Fuztys+g7hbjmQZCO0+eOxUO9ERYOmNlPnb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjhhnWjZj1d8lI67Yy60OCuAEUePlUUQNlxxqlUJH8k9nimAzbKv9OxyjZJ2mh1OGLh3Dn0QkCxcvKVhPqdjtKboANgYzTXVJFu6hQDAAqz+J71GPhMFGZsWjxmenDWJ/Pb1PkGR/8eS7QAJE59dQPkrfsHJ7y3QNrFKbAv+nvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJ962MOd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJ962MOd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2141F00AC4
	for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787324649;
	bh=wnEMR8Ookc7Xu0y7cdH3S8om7vgswlZbOn87ouUD76A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CJ962MOdwJM9OCrT+xVHgXQG8AE9m5XXYgI0GMOvL27fj7dNzSyZZ3qX7ey3hmKwY
	 erP1TcDAEHeD3IuAgKSKm1oWRtMXuVWvUPf7gSwEZnOdMf8B+0y+E21j3JtR08OhPS
	 l+3lWxRuwzMTL1jWSDGFJ/Dp01zuKSM9eosY2FqGA5YLoHUWmDpkse9M+NWujAxCbE
	 bBpa1R3i2Cq0sbJByk4MoV0JLSTu8V6BmzxUKFL/zA/s4yOjBRXKO0m5AcH/MzWkCy
	 UoSPUgFltpQY0IDy70bNr2sy2JOsLCqdxG5KnxAeafU4obPkAXsSrsVWHr7xC/JVmS
	 9Vl2ggCe4VU+Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a28cbdso2114055a12.3
        for <llvm@lists.linux.dev>; Fri, 21 Aug 2026 08:04:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqoTsRc3OJ0oytj0bTDvaogpY88AqHRYZuG3L8NaD7gj+x+X+2MSYUT2bfxJ+jLtAbeqTjW@lists.linux.dev
X-Gm-Message-State: AFuF++lfz7nGyrbt2F4aRp6lE7p6HFcMNyTE7IOuNsKELdV/5tmpwVH+
	BpxfhoQAeeZTykXlImbMFbRh4UDQn3fdaXIQCHpPvkgh+nj1/2avJ261hshr+4XCKYnfzdB244e
	fw+Dc1BJjGtQ1pOpa6Cv3a6Jsb15W+mY=
X-Received: by 2002:a17:906:6a27:b0:c12:3059:4071 with SMTP id
 a640c23a62f3a-c246a604a33mr716104866b.15.1787324647709; Fri, 21 Aug 2026
 08:04:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821-b4-disp-5297959d-v3-1-2f92f9abccee@proton.me>
In-Reply-To: <20260821-b4-disp-5297959d-v3-1-2f92f9abccee@proton.me>
From: Namjae Jeon <linkinjeon@kernel.org>
Date: Sat, 22 Aug 2026 00:03:55 +0900
X-Gmail-Original-Message-ID: <CAKYAXd8+HNjk-BXZVnv0_wwp+E-S5__gt_wKnCCmrkRv7eMPhA@mail.gmail.com>
X-Gm-Features: AcwNN1UJxWWSBL2OdkhgK93qnEY6LqtCetp9LyRSmlWNhwwvZ2TCZtszmbpnq-Q
Message-ID: <CAKYAXd8+HNjk-BXZVnv0_wwp+E-S5__gt_wKnCCmrkRv7eMPhA@mail.gmail.com>
Subject: Re: [PATCH v3] smb: client: reject a tree connect response whose byte
 count is too small
To: hexlabsecurity@proton.me
Cc: Steve French <sfrench@samba.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Tom Talpey <tom@talpey.com>, Jeff Layton <jlayton@kernel.org>, Paulo Alcantara <pc@manguebit.org>, 
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, Nathan Chancellor <nathan@kernel.org>, 
	Shyam Prasad N <sprasad@microsoft.com>, David Howells <dhowells@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 9:36=E2=80=AFPM Bryam Vargas via B4 Relay
<devnull+hexlabsecurity.proton.me@kernel.org> wrote:
>
> From: Bryam Vargas <hexlabsecurity@proton.me>
>
> CIFSTCon() bounds its strnlen() over the byte area with the server's
> ByteCount minus two, which for ByteCount 0 or 1 goes negative as an int
> and converts to a huge size_t.  The later subtraction wraps the __u16
> bytes_left, and that is what bounds cifs_strndup_from_utf16(): a bound of
> up to 65535 against a ~16 KB cifs_req_poolp object runs off the end of th=
e
> slab object, and the bytes reach userspace through tcon->nativeFileSystem
> in /proc/fs/cifs/DebugData.
>
> Reject a byte area too small for what the parser consumes.  Two bytes is
> the least it can consume, and no conformant response carries fewer.  The
> new trace point is the 129th smb_eio_trace entry, which __mode(byte)
> cannot represent, so the attribute goes with it.
>
> Fixes: cc20c031bb06 ("cifs: convert CIFSTCon to use new unicode helper fu=
nctions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryam Vargas <hexlabsecurity@proton.me>
Reviewed-by: Namjae Jeon <linkinjeon@kernel.org>
Thanks.

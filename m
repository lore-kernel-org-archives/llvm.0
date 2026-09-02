Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679514AC149
	for <llvm@lists.linux.dev>; Wed,  2 Sep 2026 17:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370165; cv=none; b=nilcZqdPjrIO6mondRNYpbdFDZgrmTlBJ1jmPmB9MWJD+qAyM4Gkp8yyHvhW5NE6L/9zvJ+3q0B00hQwjS4H24/gtgtNjE9tpJeABQ19xa6cFbXXexrpgPF7S8gVI8muuSuX10XCxHw2egtJrasMt8n2USdnbxnGcVuChRBsuZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370165; c=relaxed/simple;
	bh=TZ+MXL1cgyfSCQwzd4B83Y1gcdTqXTzpnMsgTcK9A4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=i6FkYzyPizvzCFCP82CAzumTKhESthNxPM7EzFBxDAYB/Ez7n0ENJ2hPDvPabW8vIeWz+LY5JvR+akFL465rjfyA+shzpCkOqgNcFNGJOAJze8qPKWwk5SIzmuyxKwwNYjHEFTAbWw+DLjIRz0m0LWSOeKb8KEAov11t8Uux2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FCcl6/ne; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FCcl6/ne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788370162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TZ+MXL1cgyfSCQwzd4B83Y1gcdTqXTzpnMsgTcK9A4c=;
	b=FCcl6/nex5yo/dVatACfuwRLPSj8DJEFmFUxFfYry95Z69OEArEHY/NiQEj3Tw66+whM1G
	+zkC91Cw6Am0aVoluyhggu5gQ00G1xGZCpnaKItVAHKMTG9JgkW8cQMFEAR8mfqu8g/+Bw
	vIK/9o4WcGFo3qeag/tMZc/bqRpDh64=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-aNLRFW2aOrGgUeZBTtXadg-1; Wed,
 02 Sep 2026 13:29:19 -0400
X-MC-Unique: aNLRFW2aOrGgUeZBTtXadg-1
X-Mimecast-MFC-AGG-ID: aNLRFW2aOrGgUeZBTtXadg_1788370156
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEC551834577;
	Wed,  2 Sep 2026 17:29:15 +0000 (UTC)
Received: from fedora (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D531730002F4;
	Wed,  2 Sep 2026 17:29:10 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed,  2 Sep 2026 19:29:15 +0200 (CEST)
Date: Wed, 2 Sep 2026 19:29:09 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Elliott Hughes <enh@google.com>, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, llvm@lists.linux.dev,
	Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] x86: uapi: ptrace: guard register offset macros with
 __ASSEMBLER__ or __FRAME_OFFSETS
Message-ID: <aphc5Xf0HU0SWcTI@redhat.com>
References: <20260821-ptrace_uapi-v1-1-3de8638a29f2@google.com>
 <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAKwvOdkCGEYWnyJtWT=jArXkA47X==G0PU4UNV=s8htpA3Dg6g@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: yAC0e9k2KuPCpePPEyluRosSFi9OmQMaezXApIeR2Q0_1788370156
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 09/01, Nick Desaulniers wrote:
>
> On Fri, Aug 21, 2026 at 3:46 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > The register offset macros in <asm/ptrace-abi.h> are guarded by
> > `defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)` for 64-bit, but
> > were left unguarded for 32-bit. This causes havoc for userspace that
> > happens to use identifiers colliding with these short macro names
> > (e.g., EBX, ECX, EAX, DS, ES, FS, GS, CS, SS). Without this guard,
> > userspace is forced to be super extra careful with include ordering to
> > minimize the chance of collision.
> >
> > Wrap both the 32-bit and 64-bit register definitions under
> > `#if defined(__ASSEMBLER__) || defined(__FRAME_OFFSETS)`, and ensure
> > User-Mode Linux (UML) defines `__FRAME_OFFSETS` for 32-bit as well.
> >
> > Assisted-by: Gemini
> > Link: https://github.com/llvm/llvm-project/issues/217413
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> + enh (who pulled this into android for testing)
>
> Oleg, can I get an ack/nack here?

Oh... there is a little problem, I don't understand the usage of
(magic to me) __FRAME_OFFSETS ;)

> Or someone who knows better the
> history of UAPI headers?

Certainly not me....

OK. I'll try to read this patch tomorrow with the clear head after sleep.

Oleg.


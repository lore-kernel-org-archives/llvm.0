Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448A13D28F
	for <llvm@lists.linux.dev>; Mon, 18 Nov 2024 08:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731919330; cv=none; b=HYeymTt5N/3rWvXjn6eIzdQL99MVCiIGqvywJAEBbOO0FmvbfJVjW8/fPYs41/zhWkcngnd9+IU4DjP4vsIpFnZrX4+L+91ov0XDgJTHqDEGb0iQ9YrXOUc2LSwAwEXFP0yB3/ky73oXJ1UQmVeYKcLf25zz8G2xgx6R9b78VU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731919330; c=relaxed/simple;
	bh=oFkH2/8m6D9HxxvHCKMH/r3jXPhFVtGIYAiWuJOUAbA=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=Oupi8qosz41hpWpE4AVGnThfTTw/Kol3ZaoFnW/mvovwXfE+j+O16uY2SfNr0sx/c74Sm2Rgi3fxlwKlcpoG/p13ljeLpb7AhKEeh2CdebEIyVj58SSjk4HvPQoiS1+6qBdyKTcMiZr03coSSgD6ncDvZR0/5u+r0Txb5l0bHvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fJlnEGjs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fJlnEGjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731919328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hHsMBoL6AsJR4sERZtcHMc5wiOnq+9oR30KNDbc+uD8=;
	b=fJlnEGjs4bgRkxLe1EdfoeiGfWTy32a9jZjuKpLj1LWnPLnWWfZdK1/a3zZXlFmx+nUubQ
	xf6dGQXlS7MgDtkSGneiHgbLofqwyZmEQ7ebrArxSZcasInPSPJZz+n8m9UllMVUWAItV2
	fxhKKGB4FMq1QiLa8Yn8CXA/6cmyhjo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-277-pJMSrNZENJq39J3T9ysXXg-1; Mon,
 18 Nov 2024 03:42:04 -0500
X-MC-Unique: pJMSrNZENJq39J3T9ysXXg-1
X-Mimecast-MFC-AGG-ID: pJMSrNZENJq39J3T9ysXXg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B96761955F45;
	Mon, 18 Nov 2024 08:42:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.207])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 85AC4300019E;
	Mon, 18 Nov 2024 08:42:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202411180620.8uhr11le-lkp@intel.com>
References: <202411180620.8uhr11le-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, llvm@lists.linux.dev,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:rxrpc-iothread 54/64] net/rxrpc/input.c:902:3: error: invalid operand in inline asm: ' shr${1:z} $1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 18 Nov 2024 08:42:01 +0000
Message-ID: <828048.1731919321@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DJ0RaLTIe91Bgb9Pg3xF1W4nN1Mgm1gFL9YcNJBORpo_1731919323
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <828047.1731919321.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

>    net/rxrpc/input.c:789:8: note: expanded from macro 'shiftr_adv_rotr'
>      789 |                         asm(" shr%z1 %1\n"                    =
          \
>          |                             ^
> >> net/rxrpc/input.c:902:3: error: invalid operand in inline asm: ' shr${=
1:z} $1
>     inc $0

Um.  "shr%z1" is fine in gcc.  I'm guessing clang is missing something.  I
guarded the definition with __GNUC__, but I guess clang defines __GNUC__ to
say that it is gcc compatible?

David


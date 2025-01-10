Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53354257D
	for <llvm@lists.linux.dev>; Fri, 10 Jan 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736497291; cv=none; b=MrFLHPb9hldVSciW2mkaaA4rMupqy08+l3WksONK6WmdhfXJ6eYoKNowH1p7sCrCdYSa3YH/wV0wjna9cFmXNCs3zJCsyd3iqLmoVKt+KlmPxrhOWZpHGb5TCdYiXJEmFC6Jp1+ZlXnzvn5SK7ZU6r9u1toaLqlFNjcD4KEEonI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736497291; c=relaxed/simple;
	bh=Dy075btzMlMcWfzem46MbP+RD8rq/QKp7VRIV8rHbTU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=OYzR62qBNZh6ocI9e8NwaIHUSM45yN/7pXVaY8MvxCsE5gJXoFnw3V+oZdSXSVV70IwQocT/PxWqJ6Y8nkaxifK7PFOoqr/jAgGwuZRJT4ZGrcF7iZKKwweouzmf0kvUynDwtDz8CS14EixrmB6erzWBGerfonLwB1kqtjMCRj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ReAtwQHV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ReAtwQHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736497287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y81cyk+ToM46RV8Tpev9A8BpP4FpLQ7NaEobR6X0ZTY=;
	b=ReAtwQHVs1YV4kHsep47gWcXURa2Xs9mW9f1O20V3lSILjRO712MO4o2QP8WfMT/4sg+vs
	SQtgCh+CclJVbW3xHWAJ746CeCNtS1+mB8d2tMKdRK1RocOk3+M3yLKN6EO56IPu28ZQr7
	Hj5WxyEbmOh4MbM7M8G4GEiEdnMFeNU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-6eEPwoexNeKSFjTluWcwVw-1; Fri,
 10 Jan 2025 03:21:26 -0500
X-MC-Unique: 6eEPwoexNeKSFjTluWcwVw-1
X-Mimecast-MFC-AGG-ID: 6eEPwoexNeKSFjTluWcwVw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E20A819560B2;
	Fri, 10 Jan 2025 08:21:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4D5261954B24;
	Fri, 10 Jan 2025 08:21:23 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202501101527.4qvP3A25-lkp@intel.com>
References: <202501101527.4qvP3A25-lkp@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, llvm@lists.linux.dev,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:crypto-krb5 7/8] net/rxrpc/rxgk.c:273:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 10 Jan 2025 08:21:22 +0000
Message-ID: <1481889.1736497282@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 45ZQdEJoWl0FK6dIfbbA0HBDW4M594yuCqv2ZLhCh6o_1736497285
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1481888.1736497282.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> >> net/rxrpc/rxgk.c:273:6: warning: variable 'ret' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
>      273 |         if (!req)
>          |             ^~~~
>    net/rxrpc/rxgk.c:310:9: note: uninitialized use occurs here
>      310 |         return ret;
>          |                ^~~

I think this is a clang bug.  The lines prior to that:

>    262=09=09struct aead_request *req;
>    263=09=09struct rxgk_header *hdr;
>    264=09=09struct scatterlist sg[1];
>    265=09=09size_t data_offset, data_len;
>    266=09=09void *payload =3D whdr + 1;
>    267=09=09int ret;
>    268=09
>    269=09=09_enter("%x", txb->len);
>    270=09
>    271=09=09req =3D kzalloc(sizeof(*req) + crypto_aead_reqsize(gk->tx_cry=
pto),
>    272=09=09=09      GFP_NOFS);
>  > 273=09=09if (!req)
>    274=09=09=09goto error_gk;

show req being initialised directly above the if-statement that is being
flagged.  Did "sizeof(*req)" cause the issue?

>    net/rxrpc/rxgk.c:435:6: warning: variable 'ret' is used uninitialized =
whenever 'if' condition is true [-Wsometimes-uninitialized]
>      435 |         if (!req)

Ditto.

David


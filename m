Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ECE7404E
	for <llvm@lists.linux.dev>; Sat, 29 Nov 2025 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764420416; cv=none; b=c2Q4rkkMl0zPKzVMm4P3PnVmrlWeu0KsKwqVqdg6swCD9p2rfDlGHOppOqgPK2i8shv8bd1PkO887gZPkDc5LOT66aSssaKqH6H7nKG18V7LEOBW2t+pqpZ8Y4MZ2gKH684FXU76A/fPpCkOm9uBsP81BwmCIq7hMVIjZ/i8jzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764420416; c=relaxed/simple;
	bh=jNmYIaV75YSSo0pmPTP7ijrP/T2kkl259HD2++Nrdxg=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=WKnoaNDSklLrxveCTEsSGeZ3BEgv94WOsV3zMvfB3Xh0a6uRE4gVTf2BIbbt0JBQF7UjgFfbpzgVvxMOIqv3J8Da2ny23lTgODMHOXH7cHW5SW46UTz7enaLciJd2kRtyZ3ounUqR/vFbjTTT8x0gsVlIUnm/t5+Jl5yZkaQuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eZyr09Cv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eZyr09Cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764420412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNmYIaV75YSSo0pmPTP7ijrP/T2kkl259HD2++Nrdxg=;
	b=eZyr09CvdFhmI4q46EwHFEpcZ435JjfAb7Z0/VszxXvPQ6vRQ7ZkzEO1QWYcxGt0y7if7T
	XbX8pEdNzfHn8uQtzmD3QAeEB5IJjMWqJkUg8qyIiCbAUoVtJRX7e4MawVB/yjfHqiogJC
	jmYNPf5zNaFGu3VWZVfbLtQPa0K1g3E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-FDx1AIjjN3m8rmVHq5iw1g-1; Sat,
 29 Nov 2025 07:46:50 -0500
X-MC-Unique: FDx1AIjjN3m8rmVHq5iw1g-1
X-Mimecast-MFC-AGG-ID: FDx1AIjjN3m8rmVHq5iw1g_1764420409
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81A6D180045C;
	Sat, 29 Nov 2025 12:46:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 11808180035F;
	Sat, 29 Nov 2025 12:46:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <202511291414.IgkEFchx-lkp@intel.com>
References: <202511291414.IgkEFchx-lkp@intel.com> <800328.1764325145@warthog.procyon.org.uk>
To: kernel test robot <lkp@intel.com>
Cc: dhowells@redhat.com, llvm@lists.linux.dev,
    oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] afs: Fix delayed allocation of a cell's anonymous key
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 12:46:46 +0000
Message-ID: <1221451.1764420406@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _62NSFudtXGFlx6EfVFNiU1OT3bNP2YvnMe1Ogf4K6w_1764420409
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1221450.1764420406.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> wrote:

> >> fs/afs/security.c:29:6: warning: variable 'key' is used uninitialized =
whenever 'if' condition is false [-Wsometimes-uninitialized]

This is already fixed by:

=09commit 9eef1d98eeda3745df35839190b7d4a4adea656
=09afs: Fix uninit var in afs_alloc_anon_key()

Thanks,
David


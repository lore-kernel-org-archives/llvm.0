Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8717110D
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655106728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kYmfQDM+DfhvSVg+Z40jMXH9wbjOx+s0nx48dvNO000=;
	b=Hy7oDy88owuCzhI/6Tu7/0Xk4JlVSVfx1AXFsP06y5mP1JDvMRGGyTe++BGAShkza5TLKA
	19h+zLE8p6nIC4NPdfFwcpiYS//TGi9yFc1gcsz0RbqegKleMXbbx7aKtSeP1I0YzO0sH6
	hSowViwVaQ48zGyfIYYDzjqjfRD9vBo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-BJ3OKfNJMvC6mEERcGMcPA-1; Mon, 13 Jun 2022 03:52:05 -0400
X-MC-Unique: BJ3OKfNJMvC6mEERcGMcPA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C69963C17301;
	Mon, 13 Jun 2022 07:52:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D341E2166B26;
	Mon, 13 Jun 2022 07:52:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <a1a3edde-7b44-eb09-6695-e7c57356b96e@redhat.com>
References: <a1a3edde-7b44-eb09-6695-e7c57356b96e@redhat.com> <202206112305.4DdsErK8-lkp@intel.com>
To: Xiubo Li <xiubli@redhat.com>
Cc: dhowells@redhat.com, kernel test robot <lkp@intel.com>,
    llvm@lists.linux.dev, kbuild-all@lists.01.org,
    ceph-devel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
Subject: Re: [ceph-client:testing 7/9] lib/iov_iter.c:1464:9: warning: comparison of distinct pointer types ('typeof (nr * ((1UL) << (12)) - offset) *' (aka 'unsigned long *') and 'typeof (maxsize) *' (aka 'unsigned int *'))
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1069137.1655106723.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jun 2022 08:52:03 +0100
Message-ID: <1069138.1655106723@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6

Xiubo Li <xiubli@redhat.com> wrote:

> Thanks for the warning report.
> =

> These was introduced by one DO NOT MEGE patch, which should go into main=
line
> via David Howells's tree IMO.

That appears to have been fixed upstream.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/=
?id=3D1c27f1fc1549f0e470429f5497a76ad28a37f21a

David


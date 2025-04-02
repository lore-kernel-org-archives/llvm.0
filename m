Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B271AD27
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 04:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743569531; cv=none; b=b4qgY/KGZBwZukIyeEXo5L8F3B0jVBhsfmV/29X/oAiBR98/M2G48GOo9fIIm/4P3f9uHpVbAVwQ7bgzMq7IpsB7l/DNmtPjwlChFA60AZSRWOPx5ENhfP73/YSL89EnkyYaugNzB0M25G6DMFhsxtUVFHGZ7aZlXSBKeln9Am0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743569531; c=relaxed/simple;
	bh=ncSSDdfYTuROxMvWrgTJCdGYdkoODh+muwETjBRQkbw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ImyqG+Q3paTnW8kugH5s+E7uh+q+xoN8/7jUjTMPzMdIR98Lui80YQ8BEKGBeWuJ+OYsM8iNTTVeVUB/MDY+irqbc8EinN3Xny9ZqWfALd3QvnNhhqMzRiVK+trmmgNgv32Kdo0Xwftj6zMCA+/9/puPhIZWnEzaxZmaz3ujbW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CsB2SGvr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CsB2SGvr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743569528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pvGW5p3Dz1B+r+Gz0ksC02e9D0kJcdG1lI9aJwQIXcg=;
	b=CsB2SGvrVRnOS2RxYFN79FQOnUUaNvuIXUqjt5dxg/CLTwKHBsFzVScIkVHZFprZEzmFnq
	rhgTdIR+nWbxyS45FXU6OIRrZ7JDlQTeHNaPVBmLhRsijSIrEzOTWPhcd8FzNtC+Rc8Ebg
	4yLHULANh2pxi1KkOZbJbom9CagGj2Q=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-t6POnoxyOYWziIsvgCQ_tA-1; Wed,
 02 Apr 2025 00:52:06 -0400
X-MC-Unique: t6POnoxyOYWziIsvgCQ_tA-1
X-Mimecast-MFC-AGG-ID: t6POnoxyOYWziIsvgCQ_tA_1743569525
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CEE519560AB
	for <llvm@lists.linux.dev>; Wed,  2 Apr 2025 04:52:05 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C58D3001D0E;
	Wed,  2 Apr 2025 04:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, acc4d5ff)
Date: Wed, 02 Apr 2025 04:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <74389.125040200520600391@us-mta-456.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tGgM2EhuHq9Qn3Qn1h08y_gG7L1SEUyysZBojr02QLs_1743569525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.15-rc0' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1747723683

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1747723683-x86_64-kernel-debug


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___


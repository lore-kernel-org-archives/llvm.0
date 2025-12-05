Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D11D32B997
	for <llvm@lists.linux.dev>; Fri,  5 Dec 2025 13:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764942791; cv=none; b=ghg97TCzuMfButy8H1X7KEfyxbQdcMireLTq/+9ZKopoTpt/8Be3XqfJE3QXu+T2XD+OIXpk8LowW36iKjar24PaNXXFO/ddyREO9bdwZT95SWyNCo3xj7biKKh85ffhfUohhTHWdfsomXMqyFms5JEydR1eZgtwr9ElPiT7bog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764942791; c=relaxed/simple;
	bh=FXA4hWR1dNEaiXCJ2gnwtzwqVJs6mmWDav/Hjs6xpHY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UnEVys5tM5Xn/fIWXHfusSFXn3KV1jaBrXiLl0riZ0BT3G6zWOTfcmylqSdMAMDZn2iSF3XS72xdFbcUSm5S47XnjgfXwLtMFbu+bIA4MF7RC2tQ4IGgpI6HOi8/d/Iv9pLIyK7kC60kQKfTv6rZeB5oSkZyDu0khF7FU0XH4j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TkbT9jlj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TkbT9jlj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764942787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GrOkmdhHa64rpKtPauQuxN7r3rHgyeHQxmrRINipChU=;
	b=TkbT9jljE42c2LPUKchP4YQhf3eXzoDxergXMpmKxzip6Qxue9mIMBBna0HHDWbPxPTICl
	SlDmsRfNHb0Op9dbnQWMQUvvOazfh6wpiGEWhHVX0r5HPpRxxrG36oXpSgBnQ+yPftjKur
	NVRGt7da2/7PGN38k/ZCbO7BnQMyCB8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-645-KzNhpO-xNP-5dbqJ0VnHgg-1; Fri,
 05 Dec 2025 08:53:06 -0500
X-MC-Unique: KzNhpO-xNP-5dbqJ0VnHgg-1
X-Mimecast-MFC-AGG-ID: KzNhpO-xNP-5dbqJ0VnHgg_1764942785
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0DE57195608F
	for <llvm@lists.linux.dev>; Fri,  5 Dec 2025 13:53:05 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95C57180044F;
	Fri,  5 Dec 2025 13:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, 43dfc13c)
Date: Fri, 05 Dec 2025 13:53:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <15780.125120508530600186@us-mta-645.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0bEcxOCScGHo8l1K24fX-DAwOi4qYcDiKRHsbuhmSbk_1764942785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.19-changes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2197426676

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2197426676_x86_64_kernel-debug


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


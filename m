Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206954739
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 22:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748296988; cv=none; b=jgechdAt5bfHcfGy8GbcuRQgguKF04aPrNVe7ddRR+CFXcAoGtFdjdUadYNsHK3NiXG2QsZJM9qHxhJI05XvvTjrkcy7+psrnyJZF0R75uHtNw3rM1cZ7muXpZp8WOKZkH2c7b4A77PPTxb3M+9wIyXyXPD7soHAglYLcjGOfS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748296988; c=relaxed/simple;
	bh=e6gxA7a5888cZHBivCFIJ8OS1j5AtA2SIpQ2/gThQeg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PtmFDxh6TS4ahL1oTEAEorRUKMWwLbnk9hRqByLBghEFq7Q5nGGyy+tqnbq3Wgx48387eNcR+m2gPFSOR5fvtVDuU58yTF2cn/qZP/sA3dB1Jcxiq4VmYsJwX/QecOFagslXX1OPcUPP7qsjjo3NPeoifdT3Bx4qXCcKB4coVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GuaY6ufJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GuaY6ufJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748296985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=StRjZ2HvO9fxlj8Q+0S2TcR36/QhHHD2KIdjMFuP7KQ=;
	b=GuaY6ufJK9rXxml6mg2wE6cVpHJlXj5q2/2jhM9Qxkv6+r199oj0RIMpiBJ4iINDU3FQ+K
	GckjtPNWItVkzLVtHoxCoTDGCWaz1vH6yqW4rhTn7Nn3egv3F5FdIzR9f7PfPhTgwv0Fda
	VAZCGfDYeXcZkLXWJxI2rJ9cPIvyBe0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-483-ep7EGLoTMe-yMxbM76treg-1; Mon,
 26 May 2025 18:03:03 -0400
X-MC-Unique: ep7EGLoTMe-yMxbM76treg-1
X-Mimecast-MFC-AGG-ID: ep7EGLoTMe-yMxbM76treg_1748296983
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1FAC61956094
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 22:03:03 +0000 (UTC)
Received: from [172.20.26.14] (unknown [10.30.44.116])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C552919560AB;
	Mon, 26 May 2025 22:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, 49fffac9)
Date: Mon, 26 May 2025 22:03:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <98410.125052618030400312@us-mta-483.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RJjrL5JvXEh8CLXKLllDMUdgNDzrjk8Oz0740FgnKAI_1748296983
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.16/io_uring-20250523' of git://git.ker=
nel.dk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1837478398

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1837478398-x86_64-kernel-debug


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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21636253353
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 22:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226789; cv=none; b=cCIi40rBKUizOuyE75fDREl6Hy327Le8Ygmeg1B7LexUEEvUHWr/Z4nM0AWGDBNMu7+EKlUxpkVFEdC52KbR6BkbXiGsLu5csWY/YFqI78+XNygqCY1Zo9MupQuyowWugEYe/7ZIoZZxFLZUiIoUhCsSOHWqyETwZm0ukYPL8mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226789; c=relaxed/simple;
	bh=iGuA7l7se1/9OUhhYPwYOKC9+8DepT3Z9epnjfxE9tE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MSbxxv5rnLJE4MYID7/CzqUNNbM7qQ75RK2LM1VO2TUbYNDZsfokex9LNh2mChoeg3M62COhRPvHbqAKXNXpCpor2Ohs3bAI99+wQiz59o0WwEnmb/pn0YxqN7A25ZyglVMETB4t2TxfptNwXnkChYt8IoN6OfNK/03yd4cE9Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3kf73BN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3kf73BN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739226787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q5qE6uAQ1npqNtbsEGWvouYvkBU3dZaPLr2PYxV6Bpc=;
	b=I3kf73BNcF9ajguB73f4KIjtPn333MJO45aZQwFBTnLJtHhYYievAeyh2swagPiAdzH53D
	YmTQtGJ+HXDPcFu4ND193ZUfQx0DUDjCQ6cfaaTCFOSPwtnyyrQypJj9A/jj+PHev+LwmA
	VG7NIRJbdVrNfYEbk/6alG9ISCO9kCE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-zU9bUK3KOfmLS0T6xyD8jw-1; Mon,
 10 Feb 2025 17:33:05 -0500
X-MC-Unique: zU9bUK3KOfmLS0T6xyD8jw-1
X-Mimecast-MFC-AGG-ID: zU9bUK3KOfmLS0T6xyD8jw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D5771800876
	for <llvm@lists.linux.dev>; Mon, 10 Feb 2025 22:33:04 +0000 (UTC)
Received: from [172.64.9.20] (unknown [10.30.33.134])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A02119560A3;
	Mon, 10 Feb 2025 22:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, febbc555)
Date: Mon, 10 Feb 2025 22:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <63536.125021017330500670@us-mta-618.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cBNH2GZhjoC2eCToUeqXYmhOM2dmNiBPbbBDUjqYiww_1739226784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.14-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1664588215

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1664588215-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1664588215-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1664588215-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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


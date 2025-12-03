Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EDF2D9792
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 21:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764798213; cv=none; b=O6xqNDWzo0apKqr3RJOirQuE7t5qqyBq2x0wDprFzMMkyJdAhxhoXBJ4mQ/mVQu+BD4sB38kGr5443u93VqFt00e1amMSY/T6gGbJxvMYQHV89yOODAjxyHC9nQfN2nfF2jLXRfSGUwjvEF4n2cLuGzHz1F09IByRHQRjZ9Vg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764798213; c=relaxed/simple;
	bh=p8r1HDIv6wERKyNw2t0JvAibWpqHIRjXhlUbiyZja4M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FnQFwpxME4bcv0oqtzUiManFAK8Fvi1FBLlvdIVgoEQ1n2HQYiFbsng5CvTKdJQG2WNrwA0KcgFZV2jw9DUPgRj0yCi+iGzzMIhRVhKL3kHaNWfrKOW0rTM6ROMen5aoeMcbSiSS494foNC+91jdP1UBdgHbSewGkFsQ8mTDX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKIo08Ve; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKIo08Ve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764798208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CcIgA+UkWRuJBbdWpTBCjd6VF/wjY8ZoQNm8FfNi0dQ=;
	b=XKIo08VeN2pwNM7W0rppaWsNy4DfMq6gM+mjhMNuBQXDySPh5OrOkK46HsAwCpVCyOv73N
	0EV1xKPMva2H5e++GoSmeh3+Z53sbjMY/r6dlSTZ/UZ5rLNHh1Zj/uwRgbXQFGeSNxkh9E
	W4VF9OyND2XDNBQKNGSgTDM+Yrocmj8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-MyBsow2MNuSOn5P7_HssCw-1; Wed,
 03 Dec 2025 16:43:26 -0500
X-MC-Unique: MyBsow2MNuSOn5P7_HssCw-1
X-Mimecast-MFC-AGG-ID: MyBsow2MNuSOn5P7_HssCw_1764798206
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C1E55180035A
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 21:43:25 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 62D041800357;
	Wed,  3 Dec 2025 21:43:25 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, a619fe35)
Date: Wed, 03 Dec 2025 21:43:25 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <29940.125120316432603129@us-mta-624.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: A8V4arysvOJz8-vzDO3V9S1dJv0z-jB7EAXJneNTzTA_1764798206
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.19-p1' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2194789484

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2194789484_x86_64_kernel-debug


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


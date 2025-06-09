Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D725A2A4
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 10:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749466333; cv=none; b=qoMH83T+fwQ/RripGoNmfhCco7voCdDLxnScFfelONazeqt6Rs/n13VzLTodU8PnozvNofsJueEk+KCHJAu6nrtPtJA8B37lHEX7NmEZFbc3LKOmaUwCGPyCiVu2UaTC5zTJAf+HSqE6NbGdWBY/KsJ9oWFlf4Q+SftI55WRyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749466333; c=relaxed/simple;
	bh=AytQaUqjbYECxpBYQxUoGj1AuJwuoHeA3d1v5QmTXVI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oY3PYuxw+7t5W1tUu/jNwX/QgDinRrsnfNKJHDQPfXdKJM4HMbqzg+Av3d4MMrb2fSrHeFxg4XUHjG24NJD8HNmkYx23YqrrT41EWLMzYymRf1rhMF84byY56OUNGtOwiYO6n/xdLag1HdMT775046rQDh8SZAzNOMavQspaGI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b2UnK+gY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b2UnK+gY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749466330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MjLK8UsohdJ3DqsnHMUrA13GKJOyZN/qS+METe+6Fs8=;
	b=b2UnK+gY2PJpPj+VWFzDmUkThCymKtVvNNvyoyt5vlIK+QtAZU/EjX9aQi9mvWVJ9jb1ty
	SdvjnkzFguJcWwANU0xgQLb5VFUrMvl44JUmYdnywhS/bzGtIcfWQM4HMY2JXtXQHQq0E1
	2rmADli2MRQC1tb9Pib7WfOkgf9V+Ak=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-422-zi3XH29oOrOgALq1nfTaBQ-1; Mon,
 09 Jun 2025 06:52:07 -0400
X-MC-Unique: zi3XH29oOrOgALq1nfTaBQ-1
X-Mimecast-MFC-AGG-ID: zi3XH29oOrOgALq1nfTaBQ_1749466326
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 354EE1808985
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 10:52:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DEEC619560A7;
	Mon,  9 Jun 2025 10:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 8 of 100): Test report for master
 (6.15.0, upstream-mainline, c0c9379f)
Date: Mon, 09 Jun 2025 10:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <95356.125060906520700308@us-mta-422.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k74r4uRb7JuLa2hwkuF8QDaF8l08qqMwkE_pIYYuKjo_1749466326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'usb-6.16-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/usb

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1857960931

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    kselftests upstream - bpf_test_progs [x86_64]
    Reboot test [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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


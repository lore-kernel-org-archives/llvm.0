Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D8158DC4
	for <llvm@lists.linux.dev>; Fri, 10 Jan 2025 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736479931; cv=none; b=hPXVDwrsaCNyKwYuPpwPuy7B3JiLVG/V4fpqmS+0pXdZFgbb79gZ53T94mAcTHuYn1shuPmDQ3z4nqx/MavkPn54X9gBUZVwRYIfH8r5HcX3fuJHZgKnewtNhsfNMBiNwjkksCAUxgWzyhDMRFMRYlnlS+VYNGtywYNCXPuSWXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736479931; c=relaxed/simple;
	bh=sMsAVyS/VipFh8kMWuwuJj4wrQrMyRhQ0N7kLKlYxIQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sqFG0FFue62IurXTKRp7NPkNsRr2M6qSzkY46OwZgggoYIa+O5x3lFSMMbFms0sRqy899ZxalTtZFzBJeW0DCueaykY8jTATjzB872q+Q9tMiTGMBkW+BvVdO8KkA//gRqO5NPYKBRa8jsjgZ4yf5BfcvI+bpwKexsukTktrpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JOqkjqhz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOqkjqhz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736479927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/bTV1VHnb+aW8INeRR1e0su154xHA66CJVkOzP+eUnQ=;
	b=JOqkjqhzkgFmrrbWJVDwRc6t/KUNG6nmCumokkKwHORhx0gHGROWkR4VW46HtcCYHFpzJk
	7STPwg2C1jQ7MRON9uo//bWQw+i1yiEurULRN5TnREZHJJrCY9AwrtGRVMfRdHIyF/Es0C
	cnZZ7qMiIUvqOtywZB+i7d24kCXnr8c=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-BN4wmAptOwWZkCp1GIdp0g-1; Thu,
 09 Jan 2025 22:32:05 -0500
X-MC-Unique: BN4wmAptOwWZkCp1GIdp0g-1
X-Mimecast-MFC-AGG-ID: BN4wmAptOwWZkCp1GIdp0g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 724331955DD0
	for <llvm@lists.linux.dev>; Fri, 10 Jan 2025 03:32:04 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1416D30001BE;
	Fri, 10 Jan 2025 03:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 2144da25)
Date: Fri, 10 Jan 2025 03:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <66462.125010922320500371@us-mta-584.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9metKkT__GIf4CQBohLn2NuL31EY4vAJw_aWrX9bJck_1736479924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag '6.13-rc6-ksmbd-server-fixes' of git://git.sa=
mba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1618850707

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1618850707-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1618850707-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1618850707-x86_64-kernel
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


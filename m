Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22C535964
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108730; cv=none; b=DQQ6S94EukLPWX1eiKd9bkLta9whtchrYgS0UAHjXS1pi5mYMVAOgda/eYTWqk64UmvYX7YkJT7QoohIQyt3vxMgftFwDuBjN+QZnhvgbLpVmnbNQ3N+QVyJu7eVEoW9b/vozllAP/im4blTLjDGnhcbAgn6P4Ge4tivcshz0rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108730; c=relaxed/simple;
	bh=wNCS7ueWOIdP4RecoXI2sA1f+AmJaxoYG1OgC1msmvs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=S2wcwGNbsS5lF+n1hsVEUMEOoQHqhBjGNR9H97ad9b6YxYDf6IccJ6IjSeijMiOvUG9X+WwMQiXrSp0wOl3Ap7mR+LKEIQKuZm6XXUCetEbrZq+n2mzgUSvgx5VxXuH2REbhfVkrpiPjccBMOgdIoqtSwIXZ2EhIOm6icd/4Sz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFXLELSN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFXLELSN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743108727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CwzP9c01nSGw5NAbJiplpwfsWrPhc9/F9rZbwBtGFpY=;
	b=DFXLELSNBgnuNQWJCkp5s9zwgY7rLasr6HcgniKpCzHnXx6YVmURhjGOgweVhfOXWBsztl
	cfh3LOW9FDMMM7kFco8Mj1uPhdtD6Pd/P6o2sEuYJ1AuwI38COZtY63sIh/2tHKeIUsjki
	1SpXsaPRrNoPGF0nKEQqqUxP5ducddI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-KtZ4IGK7O0KDpgtCY4Hpzg-1; Thu,
 27 Mar 2025 16:52:06 -0400
X-MC-Unique: KtZ4IGK7O0KDpgtCY4Hpzg-1
X-Mimecast-MFC-AGG-ID: KtZ4IGK7O0KDpgtCY4Hpzg_1743108725
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A66B18EBE95
	for <llvm@lists.linux.dev>; Thu, 27 Mar 2025 20:52:05 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 138351801750;
	Thu, 27 Mar 2025 20:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 3a90a72a)
Date: Thu, 27 Mar 2025 20:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <10094.125032716520600758@us-mta-681.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LInsH3K_qqCLkNzY3p55cEeK1O6BXOxT6DbICjGnIbM_1743108725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'asm-generic-6.15-2' of git://git.kernel.org/=
pub/scm/linux/kernel/git/arnd/asm-generic

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1738965307

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1738965307-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1738965307-x86_64-kernel
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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B4C846D
	for <llvm@lists.linux.dev>; Sun,  2 Feb 2025 00:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738456330; cv=none; b=mRw1UkIQAu5FwnfiAGNLB+VKlE961W6c4BE5iFVFPeyjEDLedM7JRd/VKPBzK8HiUu0OhE4Ov5pgTkvzr6e8Da2GN9c8fDnfONAUmToaWtSWEFbk5ldKkHJThLeFUTkw1L4TVljDkWDdiuZehoIjECS7a/m2MDKZZ9T4sMTJtwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738456330; c=relaxed/simple;
	bh=UH3atOoDwnmwkEuTcQ0WEEJzBUdE8r8HANwhuv7fuSY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lA1p2L4iSJGBvdkQAr+AVGcBlUXGM7hJ0/KzE5r+RN4fM280nyL4RWi4dPvKCAFU9FHgkQPxRNe52sSrPlpmyaOHexy1zScdtZ214kbZh38TBlFMXJyZV9joKPQTLOnurwG6tCq0Sl/tSZDQhyGJwohKzChZ/D5DZJl3VYrpqZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D5cadngJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D5cadngJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738456327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R0WaWP783f07jwI/q2XzhYPSHCA8mXMp0d/GRVp1PgU=;
	b=D5cadngJ3JS5SDz5e637QULl4KB8lboj17IWR2cnri72CF48Bb2RyISpbR6Npb1mt6+wck
	Lc62E8e/UFr4nvV+tRgVRCLQk8lDxwV+YJeuS8YFCiarRdg60POH6wEoEFfurTi4GpplqS
	Yv+yVJfHNdPquYUTm4bVVvoKWutSHWk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-cCAAB065N2OV7NaqTjOasQ-1; Sat,
 01 Feb 2025 19:32:06 -0500
X-MC-Unique: cCAAB065N2OV7NaqTjOasQ-1
X-Mimecast-MFC-AGG-ID: cCAAB065N2OV7NaqTjOasQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7774C1800370
	for <llvm@lists.linux.dev>; Sun,  2 Feb 2025 00:32:05 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22C4A1800980;
	Sun,  2 Feb 2025 00:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, a86bf228)
Date: Sun, 02 Feb 2025 00:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <14687.125020119320600483@us-mta-471.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TN2M7zTB3_sytb2hCRLqWEA7YCE6lQEGgJi0bPhFP1I_1738456325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pull-misc' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/viro/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1651714562

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1651714562-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1651714562-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1651714562-x86_64-kernel
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


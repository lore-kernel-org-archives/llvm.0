Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDC713AA38
	for <llvm@lists.linux.dev>; Sun, 23 Feb 2025 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740291788; cv=none; b=L5OUq2ipiHwqla/Bwy9FgZTUMWG9wIqyLfpEjp9w3r+HpMYVzRqXEJdtkZEVDMKE/pyaCAkbkjId1QQhUS3asGkZ5MXQI3a42e3U+A6cWkmXHbAHoBl2TbS3uIH6LeH8s9FcVzvcFFC1X2gEQiJYoM2R8qvmvAfFU7oK2AjoSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740291788; c=relaxed/simple;
	bh=uoSLggIWuqG9CbRX9RrywSPUhQSqc2f8wir4v/v1T7U=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BI5iSHoEAbNw+KHQL6NvCP1R+VoSYfDTEa85J9eHV1xb8dQq+1TeZhk3ZfPgdd3TdMO8MVB2eZHAyzkmXES8Fs4vGLEPiyN308m+focxWNbDUfoJ1IAB0ND1Wpg4S1CqGWTlWqKOLqAkCS0OvrmWzs8eP42aQTQTwcj0AbX0GhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OLUiFmzm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OLUiFmzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740291785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vpnHK87IBM4qi2BgO6TqUxw5at2yrhFhmG9XWI9TPyA=;
	b=OLUiFmzmIcQj/c3eZjWKapBt3kx1T83KRVpvHi2h642WTsYlHE/wpPngHBXK/Lr9/OUOR6
	1+bViI9gv0T6mV4WTLY25dOcOf4wm9jjPdv2rfd16Q5GGZJm0Lsxtzx1CbwMN7Y2mkSPc/
	JrtT4hxxsE+b13hp5OWR2rdJLTSrVwE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-qW01kMUIM_i2R6kDBIeHog-1; Sun,
 23 Feb 2025 01:23:03 -0500
X-MC-Unique: qW01kMUIM_i2R6kDBIeHog-1
X-Mimecast-MFC-AGG-ID: qW01kMUIM_i2R6kDBIeHog_1740291782
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B6391800877
	for <llvm@lists.linux.dev>; Sun, 23 Feb 2025 06:23:02 +0000 (UTC)
Received: from [172.64.3.45] (unknown [10.30.32.189])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB2C519412A3;
	Sun, 23 Feb 2025 06:23:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc3,
 upstream-mainline, 27102b38)
Date: Sun, 23 Feb 2025 06:23:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <24427.125022301230300397@us-mta-224.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C0ci0Tg8gWDotmrFgzT-K-UWz0rWIkEpno4w1f64dIc_1740291782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.14-rc3-smb3-client-fix-part2' of git://gi=
t.samba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1684349961

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1684349961-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1684349961-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1684349961-x86_64-kernel
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


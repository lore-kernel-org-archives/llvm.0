Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22B0219A7C
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741354334; cv=none; b=Us6IdAyNC7Xx8A0fyKXzmViqvb+G0Kwe7YR5/PSTZZn3bNJZi6conCAZtD6tByRKH37CiOq+6YPfH4iy/vlGHnJsk9relYOju8lfpl9MzY5sI2WuhDX3fr7XncLO4MHLjR0+hAU54IjVp6vw4TdT8mWCatpbSrFs6uchxc/ZyWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741354334; c=relaxed/simple;
	bh=aUe7k7k8EYzY0hwLg1WnR0jmQBNavbK8iBrpkpHkQ00=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JymeXVib4s1OeY7lTqVONM9ZcrEKwHckID2Jd+9mJZP7Xrq6MZlt4Uvln2af3+mpr3/ULLjAjKgStYCg71C87mIbnlv0PsX4GmE6XA55acyVRHJbBbEZIpKb9vzeQx6w8jO7gPO2kfPOdhzCpBb8lo7j3vqNdsrYiPrnGKBpqV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+AjsH2Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+AjsH2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741354331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SpgTHlRjiKwu3x5Nwqtf2b/qcbJV+DYhKT/o8Q3VvQs=;
	b=U+AjsH2QlAlHwz9O78DFcXNARCoCf7sVPhXxe6nmFQG9HEtt+yICDp1ZQOihMnVJVi5Oab
	RjsYR03B34NELUp38gdX2m0Red6tYwlLskhM0ICdyKI6NCaGQ3oalemGS88vlHvygmfUpp
	FfmYpc8M7PIWTLg7oBSke1HfOqQM8yc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-MAVOJd2eOD69E6AwN0X-kg-1; Fri,
 07 Mar 2025 08:32:10 -0500
X-MC-Unique: MAVOJd2eOD69E6AwN0X-kg-1
X-Mimecast-MFC-AGG-ID: MAVOJd2eOD69E6AwN0X-kg_1741354329
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95D991956080
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 13:32:09 +0000 (UTC)
Received: from [172.64.10.8] (unknown [10.30.34.106])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FD4B1944F2E;
	Fri,  7 Mar 2025 13:32:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc5,
 upstream-mainline, 00a7d398)
Date: Fri, 07 Mar 2025 13:32:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <32879.125030708321000991@us-mta-221.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AM_sAwySpskaOoa_toPUqcyiwo4BxeASAUUIBKNy_dI_1741354329
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: fs/pipe: add simpler helpers for common cases

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1704838655

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704838655-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1704838655-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1704838655-x86_64-kernel
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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40F1F2C2E
	for <llvm@lists.linux.dev>; Fri, 31 Jan 2025 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738350187; cv=none; b=e4jqApOj9viT/qaBZBfk/AVi1Xd+/z2MZjY1tzIclCuUABWRNkpYpYWv02Yf96j2XXhfnuXLImkPvHIEyGJNLxfGJL5K3k/dABqYfQtV/0/OfzSjC7ygq0QH0YAsc3hjAnPTV3IVvLSf9VS1Dy3vc7Cf51tLkHP9SJkBB9v/bj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738350187; c=relaxed/simple;
	bh=13r3NjS5OZHyhxxnWy27IvP93Qkg7bGlLkGVLGhPqIY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ojhvEGL8bMdcf0Cun2/25P4+l7ZRGyrafE8dTP2PaTSnQppaPa5i3cH03HwHjihkU4krhtA6QRw8ZZxmyqKkA2yzHOiWnzpcgX9gMxsFusvFCdhUbIp3cIoXw4HLrcureAC3+DQXBzUg2zGteoJGJBgyHNwrA6yfkfoSQ9mamBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bhfzRh19; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bhfzRh19"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738350184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ErVRTJk2Ebi8P6W1z39yC2qzlbDUU2JHOyXyRbiVqMY=;
	b=bhfzRh19LYcoWnQtObE0K8lmCDmEQ+L+dPlIJy+/CwzfqN5ACDBQaKlNR0SN2eNTkiVJqo
	co6WQF6f8/4TaiIPjyuWYyzqelX0i6HZTII6qskM1n66eU8EP8Zssr17FDl2PXSgQjgmoM
	Nv13PlsIvk1a+rAI4lNEJfOp5HdaYUg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-bxZC7sBWMfm6BNnj8DG3wg-1; Fri,
 31 Jan 2025 14:03:03 -0500
X-MC-Unique: bxZC7sBWMfm6BNnj8DG3wg-1
X-Mimecast-MFC-AGG-ID: bxZC7sBWMfm6BNnj8DG3wg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EA5B1800374
	for <llvm@lists.linux.dev>; Fri, 31 Jan 2025 19:03:02 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D339D1800988;
	Fri, 31 Jan 2025 19:03:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 69b8923f)
Date: Fri, 31 Jan 2025 19:03:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <14103.125013114030301893@us-mta-605.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RPveUROWnd8TfBr7tCQR9Kl3mRaKhiNOZoKi5Le9LD4_1738350182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus-6.14-ofs4' of git://git.kernel.org=
/pub/scm/linux/kernel/git/hubcap/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1650715326

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1650715326-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1650715326-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1650715326-x86_64-kernel
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


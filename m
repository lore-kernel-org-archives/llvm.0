Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9041A8F94
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 20:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737579130; cv=none; b=vGKLAH15QgEKX/tINBj7KgGuuju8pIIFUxlzCW587LJdjcuRnWDjoVkbiwIQkUiFU0x7Oh45MqVV74iwIXpaNcT3m8PTzKcWbZetjxOiuAPteshTX2Ofosi0be/nZmiXvbZd5Y5+iaO6+2QRyyuvyiLlS1ZXiY1PPNVwMuxPjm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737579130; c=relaxed/simple;
	bh=icpE5881cxoysWkkZX5mTu2i1w5B9P1HpCS7EaIa6J4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Jx2MWXGCYFfdRC55SXKmKNm8715ooPCtq1Kdt1HaOzKU8Ibw+FKUn/2BSr2RqQrrB/9DzOhBiDB+dVp+C9OKmijtJm/8qz5A/AV8YpGFvi1q9DeRKTbgf8bFytrZCeCm+SQAI3m/XSjvXGJrcz7iUOCPrdExeWURV8BFx6nlT6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JFdHusE4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFdHusE4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737579128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+2jc525wR+FcwpytUZX4xBMqVAHbStQxK0jNAcScWrA=;
	b=JFdHusE42GcE8KK5gqrTKrqi1WDB5Dq6TNGYJ3UIMe/I670PioikIh5GnK3Bf4TPopjkq6
	ocgMXdut4FtMn/bwodikz1FhlVPL7tKYY+9gsyfNr6LOEnDkJicOJR6hAZGhI09DV85wEO
	8gzjMgGzVxVMcj42TI0xfYCHorZFP8c=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-X_PSMtVqNH-kztfFjQ5Auw-1; Wed,
 22 Jan 2025 15:52:06 -0500
X-MC-Unique: X_PSMtVqNH-kztfFjQ5Auw-1
X-Mimecast-MFC-AGG-ID: X_PSMtVqNH-kztfFjQ5Auw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D74F81955DB8
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 20:52:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 73B2819560A7;
	Wed, 22 Jan 2025 20:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, d78794d4)
Date: Wed, 22 Jan 2025 20:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <10457.125012215520602038@us-mta-527.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sHF8pH7Jk9bzWPxv1VSqlWQnk-j0ludFu1CQ4aUG89I_1737579125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.14-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1636732342

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1636732342-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1636732342-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1636732342-x86_64-kernel
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


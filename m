Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA32A5CB8
	for <llvm@lists.linux.dev>; Mon,  3 Feb 2025 01:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738545788; cv=none; b=rNiI01aO31Ljykco1+g8R7NQCiiNI6IIy/mqT/Pdv8++gf0n48wzlQUpJghNbA5uQ+/W6usbCM3EnZH9ubcOW2iPfj3ETWLGEgryHqQbqnKX/1Qp6ozDo0zOsC7BeA4JdivLI1YiauijVaMHDfag983dAeAhdDBDGCWsz8fGVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738545788; c=relaxed/simple;
	bh=bz8KgsiiY4bg2k6zeYkHjx9MniIb/xFsTc6PrMjr3EE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Q8TM5DNj+MGNLLv6OjhI3VQgZvbm8yMkvmBcipjw3qvBcHHdcVU0KXYLTsoU0kdXLZ1LSAYAr41UCk2gMpwmCg0D4x2QzarwwbF+5uOyxeNkHqwvOC67/idrjYV/YfpFPEQGyx1AtIpcfY/GEh+m8IBUT+0QfUtZYp3ZNHMBC+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CoprI6ek; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CoprI6ek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738545785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jALu0bhwlfvVSf7Ix5Fd51v0LquN1AF2SoFy0My0zZo=;
	b=CoprI6ekyPwHc9cse7IetR1LeWWDlAhd6MsdMGdN4jwo/ITOtSxryJm4IH3UFSzfMXgx9+
	FdPEVQvutkarvCuU1QzbmPSh9BsYS1OTA/tbXFrdhrkgwhljSWaDM8bVYDhjJZBWoVq7fY
	yPu02gevHYDOo1wLi/cNr+gdx3UV8Pw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-617-qoH-OWMsMUGzDoXcQ4wiRw-1; Sun,
 02 Feb 2025 20:23:04 -0500
X-MC-Unique: qoH-OWMsMUGzDoXcQ4wiRw-1
X-Mimecast-MFC-AGG-ID: qoH-OWMsMUGzDoXcQ4wiRw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9506419560B1
	for <llvm@lists.linux.dev>; Mon,  3 Feb 2025 01:23:03 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3D45F19560AA;
	Mon,  3 Feb 2025 01:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc1,
 upstream-mainline, 2014c95a)
Date: Mon, 03 Feb 2025 01:23:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <76235.125020220230400622@us-mta-617.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Y2lRvFTlnqf-UhCVG6xqtdPz1wWrdygWvnmRqn_CV4_1738545783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.14-rc1

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1652392491

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1652392491-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1652392491-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1652392491-x86_64-kernel
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


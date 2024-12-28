Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471B38DC8
	for <llvm@lists.linux.dev>; Sat, 28 Dec 2024 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735417930; cv=none; b=sDX3L2s2n5YPmygf6llncswp2suC71mqk7JTuA02CiGzY6HKReP8Z5j4suJO75XDpSqv6gRBqNSjr+qXOOn0G+iMrYSwYXbzqyzs89KRY6qKdrC4lYxvccUiJ+4LFGVSlp7e6cF5gBi1N1L21iGQcwS+kZ1KccLAh/PwSYfagEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735417930; c=relaxed/simple;
	bh=Cj6wMRAGzFPtL25o6CTJo2TVbIRwlOSzrj0Cq6CpG6g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HjwzHRomR3QHpCXytd3Gs50frZ2RwQSLxX1Uq0P29qxurwdvl3bGPRgOMlFhFvxH0A5sB5N259Bd6HD5herkCM9boeEvhjlVgMcptug+N2RwFi5e7Oy9psQ46tNjnCzN2KT/75eO+pK1/EHjgeRefSp/WCylDmq926acj6Qt/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z0xX1WLy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z0xX1WLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735417927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pEZMESImKhHMK5qr8hXRmm41Y09FA7oXPJ5xlGvcPl8=;
	b=Z0xX1WLyhF96ZNvXS4WN40Fu+af8DhurEnfdjS7uIywUXOZKxQ/fXIBmmEkbFKr8hol8Nf
	QgovsIEHjc9OB/0Lc+jCazqk5OLtKt3MQ4yZugx7znNVdoYC8bGRCuBRkBMlNE1Jfaz3l9
	EM3LDMwLPuwSaVgs3b3wSryXelaQBuA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-XpJqdqlbOQ6Y69hCSC6Vjg-1; Sat,
 28 Dec 2024 15:32:05 -0500
X-MC-Unique: XpJqdqlbOQ6Y69hCSC6Vjg-1
X-Mimecast-MFC-AGG-ID: XpJqdqlbOQ6Y69hCSC6Vjg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8F5E19560A5
	for <llvm@lists.linux.dev>; Sat, 28 Dec 2024 20:32:04 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.32.189])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 68E5119560AA;
	Sat, 28 Dec 2024 20:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc4,
 upstream-mainline, 059dd502)
Date: Sat, 28 Dec 2024 20:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <44195.124122815320500207@us-mta-112.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tVakpEF4BUUscXseWGiy79qMFyxk9z3J0IHtMBdY6B8_1735417925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.13-20241228' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1605173737

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1605173737-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1605173737-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1605173737-x86_64-kernel
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


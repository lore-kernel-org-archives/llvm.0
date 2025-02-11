Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4B1D8DF6
	for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 20:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739305332; cv=none; b=nPpFhNOgVyZSBYQeBcENgzgGxRXtAC69HRLcpUMO8HPBaDvon5+W9JzGE9cgAsmvhP48OARxRsE0QwDKhotvmpdNlD/JTgvs0yEL0ch646LlvV7PzZdFZ1SIhnpoaMCoD4w9tnH2rM4ck8rRgdr7+4AUZamS0WrG4UBFOekzOPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739305332; c=relaxed/simple;
	bh=7hWuUIlmoy70Gm9Wpg7DQknrJtZA+C41HEtHhlTb4Gg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qmSHbVz9X15SEzxsYhfujj9Q/JatqFxsEhtRj1f/m6N5xiWWRfXIYRH4dbKHfIsgcZusDeUJEK5lxi5USAPCp/dUT/AOcVC3E2nP1OkBlKDtG2CmkKKMrqswz//tb1Pixr6jyToknHXFnTgBTFhFYANk/OqHA98KfE7CiYKpIuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A3jnFGd2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A3jnFGd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739305329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m6QhoEWmD+XY7JttvkC9S2pFUL4JuCm922Ej+aoUzWA=;
	b=A3jnFGd27/Qvc0q5wj2MC5IKB+EQ/XT8XXDBwCBJeNel461CQZU+4YssO7OYDcCM4EZbj0
	IEMcv6+hp0hLZz9iT82C1NyY/XC/5/ig8OKhm/xMfGozWeCg63HglaagXaxMgYHQFUaN8t
	FPBYEYN3ZUwxQ0SSij6Oy1wZculvYm8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-YifeiPS4PWKtlyeM7n7fVQ-1; Tue,
 11 Feb 2025 15:22:06 -0500
X-MC-Unique: YifeiPS4PWKtlyeM7n7fVQ-1
X-Mimecast-MFC-AGG-ID: YifeiPS4PWKtlyeM7n7fVQ_1739305326
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D36501955D82
	for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 20:22:05 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7C7991956054;
	Tue, 11 Feb 2025 20:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, 09fbf3d5)
Date: Tue, 11 Feb 2025 20:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <94452.125021115220601833@us-mta-26.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T3v5F1cNuwPG96F4LySPpxeienAPUEsvs4o0jGbqItI_1739305326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'tomoyo-pr-20250211' of git://git.code.sf.net=
/p/tomoyo/tomoyo

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1666361696

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1666361696-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1666361696-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1666361696-x86_64-kernel
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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC131166307
	for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 07:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737443589; cv=none; b=HEUuqHptGc84wPuELFTX/iCSUayxGK1yiDGT+yL/cZPk+omBJYlTB7eSEshbA6QWKXl8h7Pbts+8tQoZvEp1rzYkxs+lUiY7rATXAsG1r3iRrzW8V1aaokbPooC+5qKHABy/8uGui4rqPhTjcbm+jWngvG/eEmIIx4vrXjNomk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737443589; c=relaxed/simple;
	bh=2WKIjPG1P88A7bdlAS/nb7+FIdIYBe/OfklbAjfZi40=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=TfHY4GxHL03+iF17hUDnNjGCwM9/T0F69859BZVcFR9kLMEyVChD1lk/A37klOEkv+BTj/dOo6Sjmt0YMN0DoR/nUvVli280wbqusxzBomH9SyAcr7BC6j4thXo6JXwNeo8o9tJ/jhZHZxVFPU2mlG3oNPkvFzyyrMackd0yXrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uve/x9ls; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uve/x9ls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737443586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0YzspzgYu3YNBNZy9jZK7Cc9N/cxYWAdfUzO2fpD0AI=;
	b=Uve/x9lsBCMb6VsOZhue6NH+AVY33+jnXgYZ4kswjAvTISgMCUYW2CGg5kVmD00EslUhsl
	mcc0rGQrp0lWaqf9hSYz7qUy9I5gIGJvxOpg6j/I5rbJ61QFfp+sjBQ7/mnzCsZaXz/pSe
	+RQBdNjWf0JOVPxJK8WPKMlpdLd0B6E=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-3UTqns2FPhGLWInexOc8EQ-1; Tue,
 21 Jan 2025 02:13:04 -0500
X-MC-Unique: 3UTqns2FPhGLWInexOc8EQ-1
X-Mimecast-MFC-AGG-ID: 3UTqns2FPhGLWInexOc8EQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 198751955DDF
	for <llvm@lists.linux.dev>; Tue, 21 Jan 2025 07:13:04 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 53F5C3003E7F;
	Tue, 21 Jan 2025 07:13:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 95ec54a4)
Date: Tue, 21 Jan 2025 07:13:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <90088.125012102130500153@us-mta-587.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ulJPMKa3KlhlweNEy4i_mrdwjxEMfm4YUPO9DfE5Jvk_1737443584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'powerpc-6.14-1' of git://git.kernel.org/pub/=
scm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1633663968

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1633663968-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1633663968-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1633663968-x86_64-kernel
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


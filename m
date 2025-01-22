Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218C1CAA61
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 22:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737584531; cv=none; b=GZswha85S3pTaVUdmfJ4ITRrnVMiGjQNCUmCi3GLIUclvAzeTgO2pQSyuYVD3C9z7LWFqKKW0q8NE0Y/0mQxoWym2KtiFIZLJ4+h1tDfI4HMiAhJvCLdnwZlObj5daYDY9F9Ya6fn9gCjShlakpCvwqCKov6Uf3ptuhjyPVuZzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737584531; c=relaxed/simple;
	bh=CPOOh5dBYZFYaxjXPf9SwtB96JsPUo8fXaWNQPZQijw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UDAqTlV/FBOY1ZHZLwEFQhTbYn0Q2bEUoB7qsiOrSIvuqbnX/Z8wKVcMLw/g84E+MbYINVdqm5Jp3hxaMT6lGlBGKC+G6YsxBr3AZwMrORR/cv2ybNhtU52dHY532oTFXtp2okgh0/5SQgDnweeLuAI8APkGrmy9ejZ739ND+bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BXjUJX3i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BXjUJX3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737584528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TbeMncoGP86oxhH0Z/4sgWWrPKVbh2fMhsLn8bXNnM8=;
	b=BXjUJX3iDlBTR6qwaDCMLeyox6zaj4jlc1ltR2yJqj7eBPIxIHO8OlXt3Ia29D6eV5ORM+
	SPkAaoi3gYigtXuZqETs66txdCKagn5LQxckUpmbVV7p7F7XTJjBjC3z64B9yAATgW5WR2
	+VEYobzQs2G0lhrNX7n2xjEyAaSjeO8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-WuGXzLqMOJWB1ykQAmnDCA-1; Wed,
 22 Jan 2025 17:22:06 -0500
X-MC-Unique: WuGXzLqMOJWB1ykQAmnDCA-1
X-Mimecast-MFC-AGG-ID: WuGXzLqMOJWB1ykQAmnDCA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D41D2195396C
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 22:22:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 36C703000701;
	Wed, 22 Jan 2025 22:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 7004a2e4)
Date: Wed, 22 Jan 2025 22:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <20015.125012217220600808@us-mta-526.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dPrGRrkaJiSg-c_8UVux5KOhsvuBzZJCtRMWMX8ppYo_1737584526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'linux_kselftest-nolibc-6.14-rc1' of git://gi=
t.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1636830149

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1636830149-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1636830149-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1636830149-x86_64-kernel
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


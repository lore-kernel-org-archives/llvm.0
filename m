Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622E533CC4
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722120131; cv=none; b=s24dp7O3UDB1ZNOHo1GLdUY4B9XUB/qFvAGM8cu8+CmvMqT60EvzEWuhUgYvGMhgf74dgQ8q8WXHoE31F0AI+aJL9vqRvFkjxe7jdYiL894VvC9oL/KUiZCEhw9BRn/EoLUk91mqD1rVImabDqXY3/9Dp25zWk8vKbYYpvGFbYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722120131; c=relaxed/simple;
	bh=XyIIVTBIuWBvaNEAG+vuieFwulecio42FIgpUshSZlk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JtV/bLdH2wMhFPAURS8ZFYNwyQg4ZL6P0DaEOojpZmLVoSV4kfRHWJULK7MdU2FmTWVcTTH4r9Vg4h4k9EuyTsNnJjy0yZSbjx+5IGzDQ+EA0gD4rSA7WSLZ7mO5nsKbqvYomaUmwRjiqYNxHAPtu5RBhP/i5iGKGQS4VmRbi5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c8HvRCra; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8HvRCra"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722120128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LaIUU/6gGc15ut9KnbvUadECLUr3AeoS+O15/Y35B78=;
	b=c8HvRCraSItIIPfAupyXV2tgDSa1NTpnz+/KjOWsE5D9FgnnUC/1ph9CZSYAIYaOIAFPxc
	E2mkDcqDk6FOTK2MfDXFyjUr56qn5ryXmSlTlAx88IQuMUQLIOhoNQPE8YBTQXuqTSVO0+
	eghbxOgEmgGcjXzmkSkcfgjanS2nlr4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-480-gRdt8v4iMa-tSDDVXEnR7w-1; Sat,
 27 Jul 2024 18:42:06 -0400
X-MC-Unique: gRdt8v4iMa-tSDDVXEnR7w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8DA2C195608B
	for <llvm@lists.linux.dev>; Sat, 27 Jul 2024 22:42:05 +0000 (UTC)
Received: from [172.64.13.36] (unknown [10.30.32.93])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C3E6E1955D42;
	Sat, 27 Jul 2024 22:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 910bfc26)
Date: Sat, 27 Jul 2024 22:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <39757.124072718420605372@us-mta-480.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rust-6.11' of https://github.com/Rust-for-Li=
nux/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1390577705

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1390577705-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1390577705-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1390577705-x86_64-kernel-debug


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


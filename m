Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47626374EA
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360112; cv=none; b=hA3u8UHTFx17M8/cPZv2Br9Yh5JMig082F5y9e7FeAI7INPhugnmWhhW48gpC1dLFlIzK65H4j4V9c+VDJR7GY4bSpSMw+vg3CKy1POImxL4YMrhf6Xp7F9TkpiCPdk3jgk8miWyp5YiA6N+fRH7VO3Gr2fCPeErY6FDtGdJq3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360112; c=relaxed/simple;
	bh=lUV/lPNjjs4SqxUwNagB78IQhrR1gxj/+PGhOV8cfR4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XzMzPYEEsyLa9+qQsPCAm4ZoYShmSq+qzBqpxX05F3pYkAvb5XydW+ImdAwbrUMwt7yMUXQ6xNn0DtduBDbN5ggjzbpVw3fWwD6RC8AOidiqDqftT9vzONQgXToDcfCMydrqD3a4PhAddB81a532NcREfVJmP3xPqA8HfwL/a5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K17dYORx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K17dYORx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VlzWj8QOblCbcIgY2stAkFI3HzXgDTdz9SQZ852IrzY=;
	b=K17dYORxd0a4qAT5xkfW+mN0py0LYop8n2qhfjYcZEfYMQZXfd8qFtlVzfGcyIV84sYmBz
	VANDbJIxMJnXPHcPmoUZwJl+3i7zA+qkKAWoMU+T+T0QK925mV0B0/RzVE7xsGL7hXp8KR
	5GmWmGsjHnBkyEUyaV1qbhkWU8dCMvk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-0JvUr9BhP764vu0_Z-fkgA-1; Thu,
 26 Sep 2024 10:15:07 -0400
X-MC-Unique: 0JvUr9BhP764vu0_Z-fkgA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4CA071944D38
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:05 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ECFE91979061;
	Thu, 26 Sep 2024 14:15:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, a430d95c)
Date: Thu, 26 Sep 2024 14:15:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <43670.124092610150701695@us-mta-339.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'lsm-pr-20240911' of git://git.kernel.org/pub=
/scm/linux/kernel/git/pcmoore/lsm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1455726660

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1455726660-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1455726660-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1455726660-x86_64-kernel-debug


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


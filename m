Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AB079F2
	for <llvm@lists.linux.dev>; Sun,  7 Jul 2024 23:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720393388; cv=none; b=n/JNK8HJmZPCLM1p0tq+y3xAM0HZZtat/JshOeebaNDcyY1BmhNLpZrhKDvN3fZnlWcIPgmQeGxuC8fcH1VAw95JR/YoEQ4RwMkJbJaXu5uyfZkxPtSkqYIM9oEu8tH2Fqe99b7MXTBNU3mPJq8MFv94fLpmT/5dk/7WaCLDzxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720393388; c=relaxed/simple;
	bh=ypd8oLZM6GHwlP5ZtNyc8QGxLcyWdACFwJPCB65+mU4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=R8G2x0Pc98zhPLIBb7CU1hINl7Q+qYrxucTAchlSxba/jMlyPgD4tP5+jdsmxzH01QIuM3OCr7heVBurlPa+Yrg+kJbRAIR4UdKSYdhwY5jGMXgzfoBOGZA9qamzXYK4e1z9xujJkAuCgJwqV0RvdUqHj00Nlau+pHip+Yx0XhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gE//ZavE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gE//ZavE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720393385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BzLs0Dj+JyEnivCgcbMVWZaO0oR9s73jcYMaLDIJguE=;
	b=gE//ZavEZNvZcFkPQWrVqtV4WFia1zSPjsydzxIH/Di6NSe0HgkW11RMsnf47T4GBGeItq
	IehVLyhhhjwccMfHKTXzR3MJOyvjRSYT/L/BdiQmDRIeFhUdCCm/POSPOICQK1ZcFYMxIE
	JuO11Fi1a387ClD689gQiIUkDxpWCCQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-145-NF7ltKaxOIehXkM-zxolhA-1; Sun,
 07 Jul 2024 19:03:04 -0400
X-MC-Unique: NF7ltKaxOIehXkM-zxolhA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71A1C195609D
	for <llvm@lists.linux.dev>; Sun,  7 Jul 2024 23:03:03 +0000 (UTC)
Received: from [172.64.13.54] (unknown [10.30.32.93])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CFB9519560AE;
	Sun,  7 Jul 2024 23:03:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc7,
 mainline.kernel.org-clang, 256abd8e)
Date: Sun, 07 Jul 2024 23:03:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <57201.124070719030400243@us-mta-145.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.10-rc7

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1363641497

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1363641497-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1363641497-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1363641497-x86_64-kernel-debug


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


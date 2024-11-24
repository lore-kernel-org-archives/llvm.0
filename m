Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2654A11
	for <llvm@lists.linux.dev>; Sun, 24 Nov 2024 01:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732411388; cv=none; b=ABvM8WH8Tll9EOsDWi7RcgNX2MssSLMW5gcbVH7CIqKax/lFL0TbmkY+WzPFe9g8debcn4RwfYZo6sy9m1N6JBz2u1I+uCt59mvJG4NK9HEhpCiT070cMbDboesSZXKI79+OV8QLWwJr1m+vNQyQHw3ID7Bo7gx1ddUQljqzgAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732411388; c=relaxed/simple;
	bh=bTeTdSQyiaQXhKlk+w3sS1jTER0QnWUYsfYh34xNy5s=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XyI4IMHgwB1JTGsFiBDFD7ua9WatiI7ABKilJyyyPYyoCDdsovAWg1yfdmEZ7gV53PfchojZEuhh2HP0wZaMst5MM8g6HIVdhAa8kKmBmCm0FHEIb/EmFnpjvMWLME8xbwmvkjK/oWlXQWblEJZD3nscA+sNjZzcuY+CqXoha7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YclmHqVM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YclmHqVM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732411384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yUN/8P58i+khv96l1+/fCaLq3xwT0nFZinjzEnjajT4=;
	b=YclmHqVMd6J5ZjyNMjTH5q8ud4XK/DfcnrZ9m9NYMIX5PYvztsUPGpU0ebEH+TvAL48Czp
	c3I5dHkNsgnhyEKilibbgexAOk0iG4gBTLqWg1ltfuGwtzH8h3ZipC1N5x6mLU0SPCPbTG
	PmC1qVIaX9BiBh2RwUxJvP2Uxs6Tqng=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-83sVR0pjOjOqPkO5SqTfVg-1; Sat,
 23 Nov 2024 20:23:02 -0500
X-MC-Unique: 83sVR0pjOjOqPkO5SqTfVg-1
X-Mimecast-MFC-AGG-ID: 83sVR0pjOjOqPkO5SqTfVg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EDA0A1956096
	for <llvm@lists.linux.dev>; Sun, 24 Nov 2024 01:23:01 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B3211955F43;
	Sun, 24 Nov 2024 01:23:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, 9f16d5e6)
Date: Sun, 24 Nov 2024 01:23:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <82452.124112320230300135@us-mta-300.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1v9B0OexxBFx6KMXVvNYIz5EqSR4uycmsaM4J7sTWTY_1732411382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1557771563

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1557771563-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1557771563-x86_64-kernel-debug


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

